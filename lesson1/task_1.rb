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
