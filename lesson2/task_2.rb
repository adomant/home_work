require 'csv'
require 'pry'
require 'rspec/core'

class BaseGenerator
  attr_reader :headers, :body

  def initialize(hash, generator_klass)
    @hash = hash

    @headers = @hash[:headers]
    @body = @hash[:body]

    @instance = generator_klass.new
  end

  def generate
    @instance.generate(headers, body)
  end
end

class CsvGenerator
  def generate(headers, body)
    result = CSV.generate do |csv|
      csv << headers
      body.values.each do |value|
        csv << value
      end
    end

    File.write('the_file.csv', result)
  end
end

class XlsGenerator
  def generate(headers, body)
    result = CSV.generate do |xls|
      xls << headers
      body.values.each do |value|
        xls << value
      end
    end

    File.write('the_file.xls', result)
  end
end

h = {
  headers: ['First Name', 'Last Name', 'Age'],
  body: { '0' => ['Dima', 'Strukov', 22], '1' => ['Mikhail', 'Matyukhin', 22]
  }
}

instance = BaseGenerator.new(h, CsvGenerator)
instance.generate

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
