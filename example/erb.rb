require 'sinatra'
require 'sinatra/bootstrap'

get '/' do
  erb :index
end

__END__

@@ index
<html>
  <head>
    <!-- Note that all the include helpers are here to demonstrate how they work,
    but only a few of them (or just bootstrap) should be used at the same time, or else you will end up with duplicated includes -->
    <%= bootstrap %>
    <%= bootstrap_css false, "attribute='foo'"%>
    <%= bootstrap_js_legacy %>
    <%= bootstrap_js %>
  </head>
  <body>
    <% container :div do %>
      <% row :div do %>
        <% cols :a, cols: "a2b2", offset: "a2b2", any1:"attr1", "data-any2" => "attr2" do %>
          Hello, world!
        <% end %>
      <% end %>
      <% row :section do %>
        <% cols :a, cols: "b2d2a32", class: "hey extra classes", href: "https://github.com/mateusmedeiros/sinatra-bootstrap" do %>
          This is an example!
        <% end %>
      <% end %>
    <% end %>
    <%= bootstrap_js_default %>
  </body>
</html>
