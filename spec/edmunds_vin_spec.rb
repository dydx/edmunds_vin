require 'spec_helper'

describe EdmundsVin do

  it 'has a version number' do
    expect(EdmundsVin::VERSION).not_to be nil
  end

  describe EdmundsVin::Decoder do

    describe '.new' do

      it "requires an API Key" do
        expect{EdmundsVin::Decoder.new}.to raise_error(ArgumentError)
      end

    end

    describe '#decode' do
 
      it 'requires a vin' do
        decoder = EdmundsVin::Decoder.new('')
        expect{decoder.decode()}.to raise_error(ArgumentError)
      end

    end

  end
  
end
