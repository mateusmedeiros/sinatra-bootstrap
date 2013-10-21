require 'sinatra'
require 'sinatra/bootstrap'
require 'haml'

register Sinatra::Bootstrap::Assets

get '/' do
  haml :index
end

__END__

@@ index
%html
  %head
    -# Note that all the include helpers are here to demonstrate how they work, 
    -# but only a few of them (or just bootstrap) should be used at the same time, or else you will end up with duplicated includes
    = bootstrap
    = bootstrap_css
    = bootstrap_js_legacy
    = bootstrap_js
  %body
    - container :div do
      - row :div do
        - cols :a, cols: "a2b2", offset: "a2b2", any1:"attr1", "data-any2" => "attr2" do
          Hello, world!
      - row :section do
        - cols :a, cols: "b2d2a32", class: "hey extra classes", href: "https://github.com/mateusmedeiros/sinatra-bootstrap" do
          This is an example!
    = bootstrap_js_default

