module Rulers
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end

  class ErrorController < Controller
    def error
      "Oops, something went horribly wrong."
    end
  end
end
