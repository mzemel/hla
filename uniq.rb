
########################################
# create an array of  3 item arrays randomly
# call uniq on those to see results
########################################

# ~ 08:28:12 $ ruby uniq.rb
# Rehearsal ------------------------------------------------------------
# linked list                4.500000   0.090000   4.590000 (  4.600344)
# using string concat        6.040000   0.220000   6.260000 (  6.278408)
# using a set with lists     2.580000   0.050000   2.630000 (  2.632759)
# using a set with strings   5.630000   0.160000   5.790000 (  5.813585)
# -------------------------------------------------- total: 19.270000sec
#
#                                user     system      total        real
# linked list                4.230000   0.030000   4.260000 (  4.266593)
# using string concat        5.660000   0.100000   5.760000 (  5.773161)
# using a set with lists     2.440000   0.010000   2.450000 (  2.451979)
# using a set with strings   5.370000   0.170000   5.540000 (  5.550936)

require 'benchmark'
require 'set'

def random_num
  Random.rand(0..1000).to_f
end

# returns the index of data where check_num should be inserted
def insert_sort(data, check_num)

  return 0 if data.empty?

  halfway = (data.length / 2) - 1

  # halfway quick-check to speed up full-scan of big arrays
  if data[halfway] < check_num
    data[halfway..-1].each_with_index do |data_point, index|
      if data_point > check_num
        return index + halfway
      end
    end
  else
    data.each_with_index do |data_point, index|
      if data_point > check_num
        return index
      end
    end
  end
  return -1
end

Benchmark.bmbm(24) do |bm|

  iterations = 1_000_000

  bm.report('linked list') do
    arr = []
    iterations.times do
      arr << [random_num, random_num, random_num]
    end
    arr.uniq.length
  end

  bm.report('using string concat') do
    arr = []
    iterations.times do
      arr << [random_num, random_num, random_num].join('')
    end
    arr.uniq.length
  end

  bm.report('using a set with lists') do
    arr = Set.new
    iterations.times do
      arr << [random_num, random_num, random_num]
    end
    arr.length
  end

  bm.report('using a set with strings') do
    arr = Set.new
    iterations.times do
      arr << [random_num, random_num, random_num].join('')
    end
    arr.length
  end

  bm.report('using a set with integers') do
    arr = Set.new
    iterations.times do
      arr << [random_num, random_num, random_num].join('').to_i
    end
    arr.length
  end

  bm.report('using a set with insert sort') do
    arr = []
    iterations.times do
      rgb << [random_num, random_num, random_num]
      insert_sort(arr, rgb)
    end
    arr.length
  end

end
