
require 'vips'
require 'set'
require_relative '../enumerable'

module HLA
  module ColorVariance
    include VIPS

    def self.perform
      photo = Image.jpeg(HLA.temp_file)

      x_size = photo.x_size
      y_size = photo.y_size

      std_devs = []
      colors = Set.new

      y_size.times do |y|
        x_size.times do |x|
          rgb = photo[x,y].respond_to?(:each) ? photo[x,y] : [0,0,0]
          std_devs << rgb.standard_deviation
          colors << rgb
        end
      end

      std_dev_avg = std_devs.mean.round(2)
      variety_avg = colors.length

      variance = (std_dev_avg * variety_avg).round(2)
      p "#{self.ancestors.first} - #{variance}"

      return variance
    end

  end
end
