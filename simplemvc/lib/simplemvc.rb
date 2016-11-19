require 'simplemvc/version'
require 'simplemvc/controller'
require 'simplemvc/utils'
require 'simplemvc/dependencies'
require 'simplemvc/routing'

module Simplemvc
  class Application
    def call(env)
      return [ 500, {}, []] if env['PATH_INFO'] == '/favicon.ico'       # cleans error errors about favicon from console

      get_rack_app(env).call(env)
    end
  end
end
