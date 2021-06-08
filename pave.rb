#!/usr/bin/env ruby
require_relative 'install_module'
require_relative 'loggers'

# TODO: make logging level configurable (default to `debug` level)

verified_modules = Set.new
Dir.foreach("#{__dir__}/modules/") do |module_name|
  next if ['.', '..'].include?(module_name)

  log_info "Installing module: #{module_name}"
  install_module(module_name, verified_modules)
rescue StandardError => e
  log_error "Failed to pave machine: #{e.message}"
  exit 1
end

log_info 'Successfully paved machine!'
