require 'csv'
require 'json'
require 'pry'
require 'rspec/core'


class FileCreater

  def initialize(hash)
    @hash = hash
  end
  def headers_creation
    @headers = @hash[:headers]
  end
  def body_creation
    @body = @hash[:body]
  end
  def csv_creation
    @s = CSV.generate do |csv|
      csv << @headers
    @body.values.each do |x|
      csv << x
    end
    end
  end
  def csv_save
    File.write('the_file.csv', @s)
  end
  def xls_save
    File.write('the_file.xls', @s)
  end
end

h = {
  headers: ['First Name', 'Last Name', 'Age'],
  body: { '0' => ['Dima', 'Strukov', 22], '1' => ['Mikhail', 'Matyukhin', 22]
  }
}

instance = FileCreater.new (h)
instance.headers_creation
instance.body_creation
instance.csv_creation
instance.csv_save
instance.xls_save


RSpec.describe FileCreater do
  
  let(:h) { {
    headers: ['First Name', 'Last Name', 'Age'],
    body: { '0' => ['Dima', 'Strukov', 22], '1' => ['Mikhail', 'Matyukhin', 22]
    }
  } }

  let(:instance1) { described_class.new(h) }

  describe 'headers_creation' do
    subject { instance.headers_creation}
    it { expect(subject).to eq ["First Name", "Last Name", "Age"] }
  end

  describe 'body_creation' do
    subject { instance.body_creation}
    it { expect(subject).to eq "0" => ["Dima", "Strukov", 22], "1" => ["Mikhail", "Matyukhin", 22] }
  end
end
