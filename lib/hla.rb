
require_relative 'hla/configuration'
require_relative 'hla/extensions'
require_relative 'hla/version'
require_relative 'hla/photo'
require 'benchmark'

module HLA
  include Extensions
  include Configuration

  def self.rate(filename)
    Configuration.set_temp_file(filename)
    Configuration.photo = Photo.new
    total_score = EXTENSIONS.reduce(0) do |total, ext|
                  time = Benchmark.realtime do
                    total += rate_by(ext)
                  end
                  p "Completed in #{time}s"
                  total
                end
  end

  def self.temp_file
    Configuration::temp_file
  end

end
