require 'simplemvc'

app_base = "#{File.dirname(File.expand_path(__FILE__))}/.."
Dir.glob("#{app_base}/app/controllers/*.rb").each { |i| require i } # require '../app/controller/..rb'

module Blog
  class Application < Simplemvc::Application
  end
end