require 'erubis'

module Simplemvc
  class Controller
    attr_reader :request # def request; @request; end

    def initialize(env)
      @request ||= Rack::Request.new(env)
    end

    def params
      request.params
    end

    def render(view_name, local = {})
      filename = File.join('app', 'views', controller_name, "#{view_name}.erb" )
      template = File.read(filename)
      Erubis::Eruby.new(template).result(local)
    end

    def controller_name
      self.class.to_s.gsub(/Controller/, '').to_snake_case
    end
  end
end