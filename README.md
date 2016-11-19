<h3>App Usage</h3>
<ul>
    <li>cd simplemvc</li>
    <li>gem build simplemvc.gemspec</li>
    <li>gem install simplemvc-0.1.0.gem</li>
    <li>cd ../blog && bundle exec rackup -p 8080</li>
</ul>

<h3>Development process</h3>
<h4>Bundle setting</h4>
<ul>
    <li>$ bundle gem simplemvc</li>
    <li>$ cd simplemvc && bundle</li>
</ul>

<h4>Gem trying</h4>
<ul>
    <li>$ cd simplemvc && gem build simplemvc.gemspec</li>
    <li>$ cd simplemvc && gem install simplemvc-0.1.0.gem</li>
    <li>$ cd blog && bundle</li>
    <li>$ cd blog && rackup -p 8080</li>
    <li>input: http://localhost:8080, output: "Hello" message</li>
    <li>$ gem uninstall simplemvc</li>
    <li>$ bundle exec rackup -p 8080</li>
    <li>change body in lambda from Application class, in lib/simplemvc.rb file
    <li>input: http://localhost:8080, output: "Hello World!" in h1 tag</li>
</ul>

<h4>Simple routing</h4>
<ul>
    <li>$ cd blog && bundle exec rackup -p 8080</li>
    <li>input: http://localhost:8080/pages/about</li>
    <li>otput: text: "Something about me :)"</li>
</ul>

<h4>Views rendering</h4>
<ul>
    <li>$ cd blog && bundle exec rackup -p 8080</li>
    <li>input: http://localhost:8080/pages/about</li>
    <li>output: text: Hello, Alex. Or should call you Mr. Purkhalo</li>
</ul>

<h4>Rack request</h4>
<ul>
    <li>$ pry</li>
    <li>pry(main)> require 'rack'</li>
    <li>pry(main)>  Rack::Handler::WEBrick.run -> (env) { puts Rack::Request.new(env).inspect; [200, {}, []]}</li>
    <li>$ curl http://localhost:8080/</li>
    <li>output in pry console: @env object with it's stuff</li>
    <li>pry(main)> require 'rack'</li>
    <li>pry(main)>  Rack::Handler::WEBrick.run -> (env) { puts Rack::Request.new(env).params; [200, {}, []]}</li>
    <li>output in pry console: params is empty object, so it shows empty ahsh {}</li>
    <li>$ curl http://localhost:8080/?id\="hello"</li>
    <li>output: following hash: {"id"=>"hello"}</li>
    <li>pry(main)>  Rack::Handler::WEBrick.run -> (env) { Rack::Response.new ['Hello'], 200, { 'Content-Type' => 'text/html' } }</li>
    <li>$ curl http://localhost:8080/</li>
    <li>output: after curl command executing you should see Hello text in the same console, there was response</li>
    <li>run the server and check a console, ensure that it puts 'before' and 'after' sucessfully</li>
</ul>