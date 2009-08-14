require File.join(File.dirname(__FILE__), "../agnostic_presenters")
MongoMapper::EmbeddedDocument::ClassMethods.send :include, AgnosticPresenters::Helper if defined?(MongoMapper)