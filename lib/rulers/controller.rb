module Rulers
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(env: env)
    end

    def controller_name
      Rulers.to_underscore class_name.gsub(/Controller$/, "")
    end

    def class_name
      self.class.to_s
    end
  end

  class ErrorController < Controller
    def error
      "Oops, something went horribly wrong."
    end
  end
end
