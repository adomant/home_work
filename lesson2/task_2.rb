require 'csv'
require 'pry'
require 'rspec/core'


class BaseGenerator
  def initialize(hash)
    @hash = hash
  end
  def headers_creation
    @headers = @hash[:headers]
  end
  def body_creation
    @body = @hash[:body]
  end
end
class CsvGenerator < BaseGenerator
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
end
class XlsGenerator < BaseGenerator
  def xls_creation
    @s = CSV.generate do |csv|
      csv << @headers
      @body.values.each do |x|
        csv << x
      end
    end
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
instance = XlsGenerator.new (h)
instance.headers_creation
instance.body_creation
instance.xls_creation
instance.xls_save


RSpec.describe BaseGenerator do

  let(:t) { {
    headers: ['First Name', 'Last Name', 'Age'],
    body: { '0' => ['Dima', 'Strukov', 22], '1' => ['Mikhail', 'Matyukhin', 22]
    }
  } }

  let(:instance1) { described_class.new(t) }

  describe 'headers_creation' do
    subject { instance1.headers_creation}
    it { expect(subject).to eq ["First Name", "Last Name", "Age"] }
  end

  describe 'body_creation' do
    subject { instance1.body_creation}
    it { expect(subject).to eq "0" => ["Dima", "Strukov", 22], "1" => ["Mikhail", "Matyukhin", 22] }
  end
end
