#!/usr/bin/env ruby

def log_info(msg)
  puts "\e[0;32m[#{DateTime.now.iso8601}][info]\e[m #{msg}"
end

def log_debug(msg)
  puts "\e[0;34m[#{DateTime.now.iso8601}][debug]\e[m #{msg}"
end

def log_error(msg)
  puts "\e[0;31m[#{DateTime.now.iso8601}][error]\e[m #{msg}"
end
