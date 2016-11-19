require 'erubis'

module Simplemvc
  class Controller
    attr_reader :request # def request; @request; end                                                 # receives request

    def initialize(env); @request ||= Rack::Request.new(env); end             # transforms received request to rack hash

    def params; request.params; end                                                           # returns request's params

    def response(body, status=200, header={})
      @response = Rack::Response.new(body, status, header)                                           # receives response
    end

    def get_response; @response; end                                                                  # returns response

    def render(*args); response(render_template(*args)); end                                  # receives render template

    def render_template(view_name, local = {})                                                   # renders view template
      filename = File.join('app', 'views', controller_name, "#{view_name}.erb" )
      template = File.read(filename)

      vars = {}
      instance_variables.each do |var|
        key = var.to_s.gsub('@', '').to_sym  # @name => name; @age => age
        vars[key] = instance_variable_get(var) # { name: 'alex', age: 20}
      end

      Erubis::Eruby.new(template).result(local.merge(vars))
    end

    def controller_name                                              # helper method to receive changed controller name
      self.class.to_s.gsub(/Controller/, '').to_snake_case
    end

    def dispatch(action)
      content = self.send(action)
      if get_response
        get_response
      else
        render(action)
        get_response
        # [200, { 'Content-Type' => 'text/html' }, [ response ]]
      end
    end

    def self.action(action_name)
      -> env { self.new(env).dispatch(action_name) }
    end
  end
end