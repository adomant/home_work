require 'rspec/core'

class Human
  attr_reader :last_name
  attr_accessor :first_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def short_name
    "#{first_name} #{last_name}."
  end

  def initials
    "#{first_name[0]}#{last_name[0]}."
  end
end

RSpec.describe Human do
  let(:first_name) { 'Some thing' }
  let(:last_name)  { 'Some thing' }

  let(:instance) { described_class.new(first_name, last_name) }

  describe '#short_name' do
    subject { instance.short_name }
    it { expect(subject).to eq "#{first_name} #{last_name}." }
  end
end
class ArrayExtend < Array
  def sum
    result = 0
    self.each { |element| result += element }
  end

  def max
    result = 0

    self.each do |element|
      if element >= result
        result = element
      end
    end
    result
  end
end

calculate_instance = ArrayExtend.new([1,2,32,4])
puts calculate_instance.sum
puts calculate_instance.max
