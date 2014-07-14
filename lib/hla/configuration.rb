
require 'miro'

module HLA

  module Configuration

    def self.included(base)
      base.class_eval do
        Miro.options[:image_magick_path] = '/usr/local/bin/convert'
        Miro.options[:resolution] = '250x250'
        # Miro.options[:color_count] = 4
        Miro.options[:method] = 'histogram'
      end
    end

    class << self
      attr_accessor :temp_file
      attr_accessor :original_file

      def set_temp_file(img_str)
        @original_file = img_str
        img_type = img_str[/\.\w+$/]
        @temp_file = "tmp/temp_file#{img_type}"
        `cp #{img_str} #{@temp_file}`
      end
    end
  end

end
