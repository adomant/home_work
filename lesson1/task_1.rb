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
