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
  %body
    - container :div do
      - row :div do
        - cols :a, cols: "a2b2", offset: "a2b2", any1:"attr1", "data-any2" => "attr2" do
          Hello, world!
      - row :section do
        - cols :a, cols: "b2d2a32", class: "hey extra classes", href: "https://github.com/mateusmedeiros/sinatra-bootstrap" do
          This is an example!

