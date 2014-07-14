
require 'vips'
require 'set'
require_relative '../enumerable'

module HLA
  module ColorVariance
    include VIPS
    include Configuration

    def self.perform
      photo = Configuration.photo

      std_devs = photo.colors.collect(&:standard_deviation)

      std_dev_avg = std_devs.mean.round(2)
      variety_avg = photo.colors.length

      variance = (std_dev_avg * variety_avg).round(2)
      p "#{self.ancestors.first} - #{variance}"

      return variance
    end

  end
end
