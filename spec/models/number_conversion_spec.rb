require 'rails_helper'

RSpec.describe NumberConversion, type: :model do
  it "should convert numbers to binary" do 
    n = NumberConversion.new(number: 7, to_base: 2)
    expect(n.result).to eq('111')

    n = NumberConversion.new(number: 9, to_base: 2)
    expect(n.result).to eq('1001')

    n = NumberConversion.new(number: 189, to_base: 2)
    expect(n.result).to eq('10111101')

    expect(NumberConversion.new(number: 23516, to_base: 2).result).to eq('101101111011100')
    expect(NumberConversion.new(number: 0, to_base: 2).result).to eq('0')
  end

  # it "should return indeterminate for base 0 or base 1" do 
  #   expect(NumberConversion.new(number: 32, to_base: 0).result).to eq('indeterminate')
  #   expect(NumberConversion.new(number: 8572, to_base: 1).result).to eq('indeterminate')
  # end

  it "should convert numbers to base 3" do 
    expect(NumberConversion.new(number: 127, to_base: 3).result).to eq('11201')
    expect(NumberConversion.new(number: 4, to_base: 3).result).to eq('11')
    expect(NumberConversion.new(number: 89234, to_base: 3).result).to eq('11112101222')
    expect(NumberConversion.new(number: 28, to_base: 3).result).to eq('1001')
    expect(NumberConversion.new(number: 78, to_base: 3).result).to eq('2220')
    expect(NumberConversion.new(number: 592, to_base: 3).result).to eq('210221')
  end
  
  it "should convert numbers to base 7" do 
    expect(NumberConversion.new(number: 127, to_base: 7).result).to eq('241')
    expect(NumberConversion.new(number: 34562, to_base: 7).result).to eq('202523')
  end
  
  it "should convert numbers to hexadecimal" do 
    expect(NumberConversion.new(number: 0, to_base: 16).result).to eq('0')
    expect(NumberConversion.new(number: 1, to_base: 16).result).to eq('1')
    expect(NumberConversion.new(number: 9, to_base: 16).result).to eq('9')
    expect(NumberConversion.new(number: 10, to_base: 16).result).to eq('a')
    expect(NumberConversion.new(number: 21, to_base: 16).result).to eq('15')
    expect(NumberConversion.new(number: 87294, to_base: 16).result).to eq('154fe')
  end
  
  it "should allow valid values" do 
    expect(NumberConversion.new(number: 9, to_base: 7).valid?).to eq(true)
    expect(NumberConversion.new(number: 9, to_base: 7)).to be_valid
    expect(NumberConversion.new(number: 9, to_base: 16)).to be_valid
    expect(NumberConversion.new(number: 0, to_base: 2)).to be_valid
  end

  it "should disallow invalid numbers" do 
    expect(NumberConversion.new(number: -9, to_base: 5).invalid?).to eq(true)
    expect(NumberConversion.new(number: -1, to_base: 5)).to be_invalid
    expect(NumberConversion.new(number: 'abc', to_base: 7)).to be_invalid
  end

  it "should disallow invalid bases" do 
    expect(NumberConversion.new(number: 9, to_base: 0).invalid?).to eq(true)
    expect(NumberConversion.new(number: 1, to_base: 1)).to be_invalid
    expect(NumberConversion.new(number: 9, to_base: 'abc')).to be_invalid
    # expect(NumberConversion.new(number: 9, to_base: 2)).to be_valid
  end

  it "should disallow missing required attributes" do 
    expect(NumberConversion.new).to be_invalid
    expect(NumberConversion.new(number: '', to_base: '')).to be_invalid
  end


end
