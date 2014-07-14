#!/usr/bin/env ruby

require './lib/hla'

DIRECTORY = 'spec/fixtures/img_set'
IMAGE_PREFIX = /^medium_.*/

Dir.open(DIRECTORY).each do |item|
  next unless item.match(IMAGE_PREFIX)

  old_path = DIRECTORY
  new_path = "#{DIRECTORY}/processed"
  Dir.mkdir(new_path) unless File.exist?(new_path)

  old_item = "#{old_path}/#{item}"
  value = HLA.rate(old_item)

  p "cp #{old_item} #{new_path}/#{value}.jpg"
  system("cp #{old_path}/#{item} #{new_path}/#{value}.jpg")
end
