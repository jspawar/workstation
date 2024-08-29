#!/usr/bin/env ruby
require 'date'
require 'set'
require_relative 'loggers'

# TODO: make a module or something for this file? organize into a directory like `lib/`?
def verify_module(module_name, verified_modules)
  if verified_modules.include?(module_name)
    log_debug "Module '#{module_name}' has already been verified"
    return
  end

  module_path = "#{__dir__}/modules/#{module_name}"
  unless Dir.exist?(module_path)
    log_error "Module '#{module_name}' does not exist"
    # TODO: raise exception instead
    raise StandardError, "Module '#{module_name}' does not exist"
  end

  # read all dependencies and attempt to verify them as needed
  IO.foreach("#{module_path}/dependencies.txt") do |dependency|
    # remove trailing whitespace
    dependency = dependency.strip
    log_debug "Verifying dependency '#{dependency}' for module '#{module_name}'"
    begin
      verify_module dependency, verified_modules
    rescue StandardError => e
      log_error "Failed to verify dependency: #{e.message}"
      # TODO: what to do here instead of raising?
      raise e
    end
  end

  # verify module to see if it has already been installed
  verify_exit_status = execute_module_script("#{module_path}/verify.sh", should_log_output: true)
  if verify_exit_status.zero?
    log_debug "Module '#{module_name}' is already installed"
    verified_modules << module_name
    return
  end
end

def install_module(module_name, verified_modules)
  if verified_modules.include?(module_name)
    log_debug "Module '#{module_name}' has already been verified"
    return
  end

  module_path = "#{__dir__}/modules/#{module_name}"
  unless Dir.exist?(module_path)
    log_error "Module '#{module_name}' does not exist"
    # TODO: raise exception instead
    raise StandardError, "Module '#{module_name}' does not exist"
  end

  # read all dependencies and attempt to install them as needed
  IO.foreach("#{module_path}/dependencies.txt") do |dependency|
    # remove trailing whitespace
    dependency = dependency.strip
    log_debug "Checking dependency '#{dependency}' for module '#{module_name}'"
    begin
      install_module dependency, verified_modules
    rescue StandardError => e
      log_error "Failed to install dependency: #{e.message}"
      raise e
    end
  end

  # TODO: validate module has a verification script

  # verify module to see if it has already been installed
  verify_exit_status = execute_module_script("#{module_path}/verify.sh", should_log_output: true)
  if verify_exit_status.zero?
    log_debug "Module '#{module_name}' is already installed"
    verified_modules << module_name
    return
  end

  # execute installation script
  install_exit_status = execute_module_script("#{module_path}/install.sh")
  if install_exit_status != 0
    log_error "Failed to install module '#{module_name}'"
    log_error "Exit code: #{install_exit_status}"
    raise StandardError, "Failed to install module '#{module_name}'"
  end

  # re-run verification to confirm installation has succeeded
  verify_exit_status = execute_module_script("#{module_path}/verify.sh", should_log_output: true)
  if verify_exit_status != 0
    log_error "Module '#{module_name}' was installed, but installation is invalid"
    raise StandardError, "Module '#{module_name}' was installed, but installation is invalid"
  end

  # mark module as verified
  verified_modules << module_name
  log_info "Successfully installed module '#{module_name}'"
end

# TODO: make this private?
def execute_module_script(module_script_path, should_log_output: true)
  log_info "Begin output from module script '#{module_script_path}'" if should_log_output
  # TODO: what happens if the process prompts for input?
  spawn_opts = should_log_output ? {} : { :out => File::NULL, :err => File::NULL }
  # TODO: is the `bash -c` even needed? perhaps an `exec` instead?
  system 'bash', '-c', module_script_path, spawn_opts
  log_info "End output from module script '#{module_script_path}'" if should_log_output

  $?.exitstatus
end
