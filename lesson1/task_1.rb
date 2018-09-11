class Human

  def initialize(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
  end

  def get_name
    return @firstname
  end

  def get_lastname
    return @lastname
  end

  def short_name
    puts @firstname +' '+  @lastname[0] + "."
  end

  def initials
    puts @firstname[0] + @lastname[0]
  end
end

test = Human.new('Mikhail', 'Matyukhin')
puts "hey its #{test.get_name} #{test.get_lastname}"
test.short_name
test.initials

class Task2 < Human

  def initialize(arr)
    @arr = arr
  end

  def get_arr
    return @arr
  end

  def arr_sum
    arrsum=0
    @arr.each {|i| arrsum+=i}
    puts arrsum
  end

  def max_arr
    m=0
    @arr.each do |i|
      if i>= m
        m=i
      end
    end
    puts m
  end
end

test2 = Task2.new([1,2,32,4])
puts "yo arr is #{test2.get_arr}"
test2.arr_sum
test2.max_arr
