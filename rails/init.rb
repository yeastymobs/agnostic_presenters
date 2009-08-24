File.join(File.dirname(__FILE__), "../lib/agnostic_presenters")

if defined?(Rails)
  AgnosticPresenters::Base.send :include, ActionView::Helpers 

  class << ActionController::Base
    def add_template_helper_with_presenters(helper_module, *args, &block)
      # Hijacking any helper added to controllers so that our presenters can acces 'em.
      AgnosticPresenters::Base.instance_eval { include helper_module }
      add_template_helper_without_presenters(helper_module, *args, &block)
    end
  
    alias_method_chain :add_template_helper, :presenters
  end
end