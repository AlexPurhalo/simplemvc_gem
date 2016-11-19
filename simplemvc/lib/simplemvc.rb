require 'simplemvc/version'
require 'simplemvc/controller'

module Simplemvc
  class Application
    def call(env)
      return [302, { 'Location' => '/pages/about'}, []] if env['PATH_INFO'] == '/'   # redirects to about page from root
      return [ 500, {}, []] if env['PATH_INFO'] == '/favicon.ico'       # cleans error errors about favicon from console

      def get_controller_and_action(env)
        _, controller_name, action_name = env['PATH_INFO'].split('/')     # => "pages", "about" = ["", "pages", "about"]
        controller_name = controller_name.capitalize + 'Controller'                               # => "PagesController"
        # const_get('some_name') - looks to constant by the name param
        [Object.const_get(controller_name), action_name]             # => [Object.const_get("PagesController"), "about"]
      end

      controller_class, action = get_controller_and_action(env)        # => Object.const_get("PagesController"), "about"
      response = controller_class.new.send(action)            # => Object.const_get("PagesController").new.send("about")

      [200, { 'Content-Type' => 'text/html' }, [ response ]]                                       # returns this lambda
    end
  end
end
