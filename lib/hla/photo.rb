require 'vips'

class Photo
  include VIPS
  attr_accessor :image, :pixel_map, :width, :height, :min, :max

  def initialize(filename = HLA.temp_file)
    @image = Image.jpeg(filename)
    @pixel_map = Hash.new(0)
    @width, @height = @image.x_size, @image.y_size
    set_pixel_map!
    set_min_and_max!
  end

  def set_pixel_map!
    @height.times do |y|
      @width.times do |x|
        rgb = @image[x,y].respond_to?(:each) ? @image[x,y] : [0,0,0]
        @pixel_map[rgb] += 1
      end
    end
  end

  def colors
    @pixel_map.keys
  end

  # def set_min_and_max!
  #   min, max = @image[0,0].inject(&:+), @image[0,1].inject(&:+)
  #   colors.each do |rgb|
  #     if rgb.inject(&:+) > max
  #       max = rgb 
  #     elsif rgb.inject(&:+) < min
  #       min = rgb
  #     end
  #   end
  #   rgb_reduce = colors.collect{|rgb| rgb.inject(&:+)}
  #   @min = rgb_reduce.min
  #   @max = rgb_reduce.max
  # end

end