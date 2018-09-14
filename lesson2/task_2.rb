require 'csv'

header = ['first name', 'last name', 'age']
body = ['first name' => 'Dima', 'last name'=> 'Strukov', 'age' => '22']
column_names = header
s = CSV.generate do |csv|
  csv << column_names
  body.each do |x|
    csv << x.values
  end
end
File.write('the_file.csv', s)
File.write('the_file.xls', s)
