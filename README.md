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