# require 'pry'

class Triangle
  # write code here
  attr_reader :kind
  def initialize(len1, len2, len3)
    # binding.pry

    all_lengths_are_greater_than_0 = all_are_greater_than_0?([len1, len2, len3])
    valid_triangle_inequality = two_sides_greater_than_1?([len1, len2, len3])

    if  all_lengths_are_greater_than_0 && valid_triangle_inequality
      @kind = get_triangle_type(len1, len2, len3)
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

  private
  def get_triangle_type(len1, len2, len3)
    if(len1 == len2 && len1 == len3)
      :equilateral
    elsif [len1, len2, len3].uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  def all_are_greater_than_0? (arr_of_lens)
    return true unless !!arr_of_lens.find {|len| len <= 0}
    false
  end

  def two_sides_greater_than_1?(arr_of_lens)
    arr_of_lens.each.with_index do |first_len, first_index|
      arr_of_lens.each.with_index do |second_len, second_index|
        arr_of_lens.each.with_index do |third_len, third_index|
          if (first_index != second_index && first_index != third_index && second_index != third_index)
            return false unless first_len < second_len + third_len
          end
        end
      end
    end
 
    return true
  end
end

# binding.pry
