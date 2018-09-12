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

class Calculate < Human
  def sum(array)
    result = 0
    array.each { |element| result += element }
  end

  def max(array)
    result = 0

    array.each do |element|
      if element >= result
        result = element
      end
    end
    result
  end
end

calculate_instance = Calculate.new('Mikhail', 'Matyukhin')
test2 = [1,2,32,4]
puts calculate_instance.sum(test2)
puts calculate_instance.max(test2)
