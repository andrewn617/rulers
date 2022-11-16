require "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"

module Rulers
  class Application
    def call(env)
      if env["PATH_INFO"] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      elsif env["PATH_INFO"] == "/"
        return [200, { 'Content-Type' => 'text/html' }, [HomeController.new(env).index]]
      end

      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      text = begin
        controller.send(action)
      rescue StandardError => e
        File.open("debug.text", "w") do |f|
          f.write(e.message)
        end
        return [
          500,
          { 'Content-Type' => 'text/html' },
          [ErrorController.new(env).error]
        ]
      end
      [
        200,
        { 'Content-Type' => 'text/html' },
        [text]
      ]
    end
  end
end
