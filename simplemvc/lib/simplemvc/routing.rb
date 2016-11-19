module Simplemvc
  class Router
    def initialize; @routes = []; end # regexp, target

    def match(url, *args)             # ["/my_pages/about", "/my_pages/tell_me"], ["my_pages#about", "my_pages#tell_me"]
      target = args.shift if args.size > 0                       # shift removes a first element in array and returns it
      @routes.push({ regexp: Regexp.new("^#{url}$"), target: target })
      # route example: [{ target: "my_pages#tell_me", regexp: /^\/my_pages\/tell_me$/ } ...]
    end

    def check_url(url) # /my_pages/tell_me                                  # calls controller (lambda) by action's name
      @routes.each do |route|
        if route[:regexp].match(url)             # Object.const_get(MyPagesController.action('tell_me')) => calls lambda
          return Object.const_get("#{$1.to_camel_case}Controller").action($2) if /^([^#]+)#([^#]+)/.match(route[:target])
        end
      end
    end
  end

  class Application
    def route(&block)                                                                  # blocks.map do { |block| block }
      @router ||= Simplemvc::Router.new
      @router.instance_eval(&block) # executes this block
    end

    def get_rack_app(env); @router.check_url(env['PATH_INFO']); end
  end
end