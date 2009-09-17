require 'ostruct'
begin ; require 'active_record' ; rescue LoadError; require 'rubygems'; require 'active_record'; end

$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), 'lib'))

require 'ar-extensions/extensions'
require 'ar-extensions/foreign_keys'

#load all available functionality for specified adapter
# Ex. ENV['LOAD_ADAPTER_EXTENSIONS'] = 'mysql'
if ENV['LOAD_ADAPTER_EXTENSIONS']
  #require "active_record/connection_adapters/#{ENV['LOAD_ADAPTER_EXTENSIONS']}_adapter.rb"
  file_regexp = File.join(File.dirname(__FILE__), 'lib', 'ar-extensions','foreign_keys.rb')
                        
  Dir.glob(file_regexp){|file| require(file) }
end
