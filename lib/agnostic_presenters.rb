require "proxen"

module AgnosticPresenters
  class NoPresenter < StandardError; end

  class Base
    attr_reader :object

    def initialize(object)
      @object = object
    end
  end

  module Helper

    def presenters(&block)
      klass = Class.new(::AgnosticPresenters::Base)
      klass.class_eval(&block)
      const_set(:Presenters, klass)
      
      self.send :include, Proxen
      self.class_eval do
        Proxen::Proxy.add(self, :_presenters, :if => /!$/)

        def method_missing(sym, *args, &block)
          Proxen::Proxy.handle(self, sym, *args, &block) || super
        end

        def _presenters
          @_presenters ||= self.class::Presenters.new(self)
        rescue NameError
          raise ::AgnosticPresenters::NoPresenter, "No presenter has been found for #{self.class.name}."
        end
      end
    end

  end
end