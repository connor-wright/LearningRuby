# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  assert_inputs(a, b, c)
  if a == b and b == c
    :equilateral
  elsif a == b or b == c or c == a
    :isosceles
  else
    :scalene
  end
end

def assert_inputs(a, b, c)
  #sides need to be larger than 0
  if a <= 0 or b <= 0 or c <= 0
    raise TriangleError, "sides cannot be less than 0"
  end 
  #2 sides of a triangle should add up to more than the third
  assert_side_length(a, b ,c)
end

def assert_side_length(a, b, c)
  #grab largest side
  #smarter way is to order the array
  if a >= b and a >= c
    largest = a
    sides = [b, c]
  elsif b >= a and b >= c
    largest = b
    sides = [a, c]
  else
    largest = c
    sides = [a, b]
  end
  if largest >= sides[0] + sides[1]
    raise TriangleError, "two smaller sides must be larger than the biggest"
  end
end


# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
