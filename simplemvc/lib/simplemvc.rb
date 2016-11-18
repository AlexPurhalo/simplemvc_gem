require "simplemvc/version"

module Simplemvc
  class Application
    def call(env)
      [200, { "Content-Type" => "text/html" }, ["<h1>Hello Wrold!</h1>"]]
    end
  end
end
