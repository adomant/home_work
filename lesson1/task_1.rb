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

class ArrayExtend < Array
  def sum
    result = 0
    if self.all? { |element| element.is_a? Integer }
      self.each { |element| result += element }
      result
    else
      "error, wrong array"
    end
  end

  def max
    result = self[0]
    if self.all? { |element| element.is_a? Integer}
      self.each do |element|
        if element > result
          result = element
        end
      end
      result
    else
      "error, wrong array"
  end
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

RSpec.describe ArrayExtend do
  let(:array1)   { [1,2,3,4] }
  let(:array2)   { [nil] }
  let(:array3)   { [1,2,'something'] }
  let(:array4)   { [-1,-2,-500,4] }

  let(:instance1) { described_class.new(array1) }
  let(:instance2) { described_class.new(array2) }
  let(:instance3) { described_class.new(array3) }
  let(:instance4) { described_class.new(array4) }

  describe '#sum' do
    subject { instance1.sum }
    it "It showing the sum of array" do
      expect(subject).to eq(10)
    end
  end

  describe '#sum' do
    subject { instance2.sum }
    it "It showing the sum of array2" do
      expect(subject).to eq "error, wrong array"
    end
  end

  describe '#sum' do
    subject { instance3.sum }
    it "It showing the sum of array3" do
      expect(subject).to eq("error, wrong array")
    end
  end

  describe '#max1' do
    subject {instance1.max}
    it "It showing max number in array" do
      expect(subject).to eq(4)
    end
  end

  describe '#max2' do
    subject {instance2.max}
    it "It showing max number in array" do
      expect(subject).to eq "error, wrong array"
    end
  end

  describe '#max3' do
    subject {instance4.max}
    it "It showing max number in array" do
      expect(subject).to eq (4)
    end
  end

end
