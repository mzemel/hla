
require_relative 'extensions/color_variance'

module  HLA
  module Extensions

    # autoload extensions
    EXTENSIONS = [
      'color_variance'
    ]

    def self.included(base)
      base.class_eval do
        extend ClassMethods
      end
    end

    module ClassMethods

      def rate_by(ext, filename=nil)
        HLA::Configuration.set_temp_file(filename) if filename
        const_ext = "HLA::#{camelize(ext)}"
        extension = Kernel.const_get(const_ext)
        extension.send(:perform)
      end

      private

      def camelize(str)
        str.split("_").each {|s| s.capitalize! }.join("")
      end

    end
  end
end
