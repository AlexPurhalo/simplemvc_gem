<h3>Development process</h3>
<ul>
    <li>$ bundle gem simplemvc</li>
    <li>$ cd simplemvc && bundle</li>
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