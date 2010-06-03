require File.join(File.dirname(__FILE__), "../agnostic_presenters")
MongoMapper::Document.append_extensions(AgnosticPresenters::Helper) if defined?(MongoMapper)
