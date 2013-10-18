module Sinatra
  module Bootstrap
    module Helpers
              
      def cols(tag, attrb = {}, &block)
        cols = attrb[:cols] || ''
        offset = attrb[:offset] || ''
        extr_class = attrb[:class].nil? ? '' : " #{attrb[:class]}"

        attrb.delete :cols
        attrb.delete :offset
        attrb.delete :class

        extr_attrb = ''
        attrb.each do |key, value|
          extr_attrb << " #{key}=\"#{value}\""
        end
        
        #validate input with regex
        unless /^([abcd]{1}\d+){1,}$/ === cols || /^([abcd]{1}\d+){1,}$/ === offset then return '' end

        #set invalid to empty
        unless /^([abcd]{1}\d+){1,}$/ === cols then cols = '' end
        unless /^([abcd]{1}\d+){1,}$/ === offset then offset = '' end

        values = { cols: [], offset: [] }

        /a{1}(\d+)/.match(cols) do |m|
          values[:cols] << ['xs', m.captures.first]
        end
        /b{1}(\d+)/.match(cols) do |m|
          values[:cols] << ['sm', m.captures.first]
        end
        /c{1}(\d+)/.match(cols) do |m|
          values[:cols] << ['md', m.captures.first]
        end
        /d{1}(\d+)/.match(cols) do |m|
          values[:cols] << ['lg', m.captures.first]
        end

        /a{1}(\d+)/.match(offset) do |m|
          values[:offset] << ['xs', m.captures.first]
        end
        /b{1}(\d+)/.match(offset) do |m|
          values[:offset] << ['sm', m.captures.first]
        end
        /c{1}(\d+)/.match(offset) do |m|
          values[:offset] << ['md', m.captures.first]
        end
        /d{1}(\d+)/.match(offset) do |m|
          values[:offset] << ['lg', m.captures.first]
        end
        #e.g. values now = { cols: [["xs", "2"], ["sm", "3"]], offset: [["sm", "3"], ["md", "3"]] }

        classes = ''
        values[:cols].each do |type, number|
          classes << "col-#{type}-#{number} "
        end

        values[:offset].each do |type, number|
          classes << "col-#{type}-offset-#{number} "
        end
        classes.strip!

        concat_content "<#{tag} class=\"#{classes}#{extr_class}\"#{extr_attrb}>"
        concat_content "#{ capture_html &block }</#{tag}>"
      end

      def container(tag, attrb = {}, &block)
        extr_class = attrb[:class].nil? ? '' : " #{attrb[:class]}"

        attrb.delete :class

        extr_attrb = ''
        attrb.each do |key, value|
          extr_attrb << " #{key}=\"#{value}\""
        end

        concat_content "<#{tag} class=\"container#{extr_class}\"#{extr_attrb}>"
        concat_content "#{ capture_html &block }</#{tag}>"
      end

      def row(tag, attrb = {}, &block)
        extr_class = attrb[:class].nil? ? '' : " #{attrb[:class]}"

        attrb.delete :class

        extr_attrb = ''
        attrb.each do |key, value|
          extr_attrb << " #{key}=\"#{value}\""
        end

        concat_content "<#{tag} class=\"row#{extr_class}\"#{extr_attrb}>"
        concat_content "#{ capture_html &block }</#{tag}>"
      end
    end
  end
end