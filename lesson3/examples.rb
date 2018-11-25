require 'pry'
#Proc && lambda memoization lesson

#its LAMBDA
class A
  def hello_lambda
    a = lambda { return 'Hello' }
    a.call

    puts 'LAMBDA'
  end
end
# its PROC
class B
  def yo_proc
    b = Proc.new { return 'yo' }
    b.call

    puts 'PROC'
  end
end

puts B.new.yo_proc
A.new.hello_lambda

# Arguments

# will work perfectly, case not require all arguments provided
a = Proc.new { |name, first_name, last_name| puts "Hello #{name}" }
a.call('Misha')

# wont work case require all 3 arguments provided
# b = lambda { |name, first_name, last_name| puts "Hello #{name}" }
# b.call('Dima')

# same objects had different object_id if one of them uses memoization
a ||= 20
puts a.object_id

a = 20
puts a.object_id

# same objects have same object_id if its string no matter if its memoization or not

a = 'yo'
puts a.object_id

a ||= 'yo'
puts a.object_id
