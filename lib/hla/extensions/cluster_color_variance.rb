
require 'miro'
require 'set'
require_relative '../enumerable'
require "benchmark"

module HLA
  module ClusterColorVariance

    def self.perform
      img = Miro::DominantColors.new(HLA.temp_file)
      rgb = img.to_rgb.to_set
      p "#{self.ancestors.first} -- #{rgb.length}"
    end

  end
end
