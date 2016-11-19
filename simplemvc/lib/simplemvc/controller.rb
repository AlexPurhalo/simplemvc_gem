require 'erubis'

module Simplemvc
  class Controller
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