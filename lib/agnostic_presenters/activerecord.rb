require File.join(File.dirname(__FILE__), "../agnostic_presenters")
ActiveRecord::Base.send :extend, AgnosticPresenters::Helper if defined?(ActiveRecord)