
sinatra-bootstrap
=================

This is a fork of sinatra-twitter-bootstrap by mfojtik. Which you can check out at https://github.com/mfojtik/sinatra-twitter-bootstrap.

When I found it it was exactly what I was looking for, but I wanted bootstrap 3, so I made this fork just to bump the bootstrap and do a pull-request.
Bootstrap 3 was significantly different though, so I ended up having to do a major revamp of the code. 

Because of that, I decided to keep this fork separated, at least for now. He can feel free to pull this to a branch or whatever (or you, whoever you are).

What it does right now?
-----------------------

 * [Include helpers for Bootstrap 3](https://github.com/mateusmedeiros/sinatra-bootstrap/wiki/Include-helpers)
 * [Content helpers for cols/offsets, row and container](https://github.com/mateusmedeiros/sinatra-bootstrap/wiki/Content-helpers), and more to come, when I decide which.
  
The helpers should work on ERB and HAML. Adding at least Slim to that list is in my top priorities, but that will have to wait for now.
Note that the gem will take care of everything (including etag and cache), you just need to add the gem and the include there.

Getting started
---------------


#### Bundler

If you use bundler, you should add this to your Gemfile:

```ruby
gem 'sinatra-bootstrap', :require => 'sinatra/bootstrap'
```

and then `bundle install`

As noted in [Bundler setup](http://bundler.io/bundler_setup.html), you will probably also need to require them manually if you don't have Bundler set up to require them automagically.


#### Non-bundler

If you don't use bundler (like me):

```bash
gem install sinatra-bootstrap
```

then you should add this to your application main file (the one where you require sinatra)

```ruby
register Sinatra::Bootstrap::Assets
```

(put it inside your application block if you're using the modular style)

and don't forget to require it

```ruby
require 'sinatra/bootstrap'
```


Overview
--------

```rhtml
<html>
  <head>
  <%= bootstrap_css false, "attribute='foo'"%>
  <%= bootstrap_js_legacy %>
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
```

Will result in the following html:

```html
<html>
  <head>
    <link rel='stylesheet' type='text/css' attribute='foo' href='http://something:someport/css/bootstrap.min.css'> 
    <!--[if lt IE 9]> 
    <script type='text/javascript'  src='http://something:someport/js/html5.js'></script>
    <script type='text/javascript'  src='http://something:someport/js/respond.min.js'></script> 
    <![endif]--> 
  </head>
  <body>
    <div class="container">
      <div class="row">
        <a class="col-xs-2 col-sm-2 col-xs-offset-2 col-sm-offset-2" any1="attr1" data-any2="attr2">
          Hello, world!
        </a>
      </div>
      <section class="row">
        <a class="col-xs-32 col-sm-2 col-lg-2 hey extra classes" href="https://github.com/mateusmedeiros/sinatra-bootstrap">
          This is an example!
        </a>
      </section>
    </div>
    <script type='text/javascript'  src='http://something:someport/js/jquery.min.js'></script>
    <script type='text/javascript'  src='http://something:someport/js/bootstrap.min.js'></script>
  </body>
</html>
```

I made the cols helper the shortest I could (very soon I'll add the option to use just c: and o: instead of cols: and offset: to make it even shorter).

The way you use the cols and offsets is "aXXbXXcXXdXX". 
"a" is equivalent to "xs", "b" to "sm", "c" to "md" and "d" to "lg".

The XX are the numbers you want, but note that sinatra-bootstrap won't make any try to see if you used a valid number (<= 12).

sinatra-bootstrap also won't care if you use "a" on offset, because even though there's no col-xs-offset, AFAIK, it's planned for Bootstrap 3.1 .

e.g. 
`cols :div, cols: "a2d14", offset: "a1d2"` :

 `<div class="col-xs-2 col-lg-14 col-xs-offset-1 col-lg-offset-2"></div>`

For more info refer to the example above and the complete ones in example folder, and specially [the wiki](https://github.com/mateusmedeiros/sinatra-bootstrap/wiki)


TO-DO
-----

 * ~~Rework include helpers~~
 * ~~Add helpers for cols~~
 * Correct stuff about licenses
 * Add RSpec tests
 * Add support for other template engines (right now only ERB and HAML are supported)
 * Add Rdoc
 * Finish wiki
 * Completely correct any indentation problem for all template engines
 * Add some more content helpers


License
-------


sinatra-twitter-bootstrap is licensed under Apache Software License 2.0 (ASLv2)
http://www.apache.org/licenses/LICENSE-2.0.txt

Bootstrap is licenced under Apache Software License 2.0 (ASLv2) (though 3.1 will be under MIT, thanks god)
http://www.apache.org/licenses/LICENSE-2.0.txt

JQuery is licenced under MIT license.
html5Shiv is licenced under MIT/GPL2 (https://github.com/aFarkas/html5shiv)

Any code added by me is licensed under WTFPL, so you can DO WHAT THE F... YOU WANT with it
http://www.wtfpl.net/txt/copying/


