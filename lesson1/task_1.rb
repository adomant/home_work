class Human
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def name
    @first_name
  end

  def lastname
    @last_name
  end

  def short_name
    puts "#{@first_name} #{@last_name}."
  end

  def initials
    puts "#{@first_name[0]}#{@last_name[0]}."
  end
end

test = Human.new('Mikhail', 'Matyukhin')
puts "hey its #{test.name} #{test.lastname}"
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
