require 'sinatra/outputbuffer'
require 'sinatra/bootstrap/helpers'

module Sinatra
  module Bootstrap
    module Assets

      ASSETS = {
        css: [
          ['bootstrap.min.css', 'cde1a9a9098238450afb8fccfce94c22fa2743e3']
        ],
        default_js: [
          ['jquery.min.js', '0511abe9863c2ea7084efa7e24d1d86c5b3974f1'],
          ['bootstrap.min.js', '75a42212affc118fef849aba4b9326a7da2acda1']
        ],
        legacy_js: [
          ['html5.js', 'c9d8ca77abcd9789b91b4c3263f257e1fc1ee103'],
          ['respond.min.js', '301398aa216be8655b976ba153d299c2c54a73d4']
        ],
        fonts: [
          ['glyphicons-halflings-regular.eot', 'd53dff38dfb5c414015dfb31d30a473c95b50904'],
          ['glyphicons-halflings-regular.svg', '796e58aedfcfe8a3b0829bc0594f739936a9d7d0'],
          ['glyphicons-halflings-regular.ttf', 'c427041d38cd6597ae7e758028ab72756849ec26'],
          ['glyphicons-halflings-regular.woff','c707207e52ffe555a36880e9873d146c226e3533']
        ]
      }

      def self.css_tag(url, attrb = '')
        "<link rel='stylesheet' type='text/css' #{attrb} href='#{url}'>\n"
      end

      def self.js_tag(url, attrb = '')
        "<script type='text/javascript' #{attrb} src='#{url}'></script>\n"
      end

      def self.generate_bootstrap_asset_routes(app)
        ASSETS.each do |kind, files|
          files.each do |file|
            name, sha1 = file
            app.get '/%s/%s' % [kind.to_s.split('_').last, name], :provides => name.split('.').last do
              cache_control :public, :must_revalidate, :max_age => 3600
              etag sha1
              File.read(File.join(File.dirname(__FILE__), 'assets', name))
            end
          end
        end
      end

      def self.registered(app)
        generate_bootstrap_asset_routes(app)
        app.helpers Sinatra::OutputBuffer::Helpers
        app.helpers AssetsHelpers
        app.helpers Helpers
      end

    end

    module AssetsHelpers

      def bootstrap_css(meta = true, attrb = '')
        output = ''
        output += "<meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" if meta

        Assets::ASSETS[:css].each do |file, _|
          output += Assets::css_tag url('/css/%s' % file), attrb 
        end

        output.chomp
      end

      def bootstrap_js_legacy(attrb = '')
        output = ''

        Assets::ASSETS[:legacy_js].each do |file, _|
          output += Assets::js_tag url('/js/%s' % file), attrb
        end

        "<!--[if lt IE 9]> \n#{output.chomp} \n<![endif]-->"
      end

      def bootstrap_js_default(attrb = '')
        output = ''

        Assets::ASSETS[:default_js].each do |file, _|
          output += Assets::js_tag url('/js/%s' % file), attrb
        end

        output.chomp
      end

      def bootstrap_js(attrb = '')
        "#{bootstrap_js_legacy(attrb)} \n#{bootstrap_js_default(attrb)}"
      end

      def bootstrap(attrb = '')
        "#{bootstrap_css(attrb)} \n#{bootstrap_js_legacy(attrb)} \n#{bootstrap_js_default(attrb)}"
      end

    end
  end
end
