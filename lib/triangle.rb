# require 'pry'

class Triangle
  # write code here
  def initialize(len1, len2, len3)
    @len1 = len1
    @len2 = len2
    @len3 = len3
  end

  def kind
    if  all_lengths_greater_than_0? && valid_triangle_inequality?
      triangle_type
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

  private
  def triangle_type
    if(@len1 == @len2 && @len1 == @len3)
      :equilateral
    elsif [@len1, @len2, @len3].uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  def all_lengths_greater_than_0?
    return true unless !![@len1, @len2, @len3].find {|len| len <= 0}
    false
  end

  def valid_triangle_inequality?
    (@len1 < @len2 + @len3) && (@len2 < @len1 + @len3) && (@len3 < @len1 + @len2)   
  end
end

# binding.pry
