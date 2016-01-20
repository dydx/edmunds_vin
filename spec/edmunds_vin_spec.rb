require 'spec_helper'

describe Edmunds do
  it 'has a version number' do
    expect(Edmunds::VERSION).not_to be nil
  end

  describe Edmunds::Vin do
    describe '.new' do
      it "requires an API key" do
        expect { Edmunds::Vin.new('') }.to raise_error(ArgumentError)
      end
    end

    describe '.full' do
      let(:api) { Edmunds::Vin.new(ENV['EDMUNDS_API_KEY']) }

      it "requires a valid VIN" do
        expect { api.full('') }.to raise_error(ArgumentError)
      end

      it "returns a JSON response" do
        expect( api.full('4T1BK1EB6DU056165') ).to include_json(
          "squishVin": '4T1BK1EBDU'
        )
      end
    end

    describe '.basic' do
      let(:api) { Edmunds::Vin.new(ENV['EDMUNDS_API_KEY']) }

      it "requires a valid VIN" do
        expect { api.basic('') }.to raise_error(ArgumentError)
      end

      it "returns a JSON response" do
        expect( api.basic('4T1BK1EB6DU056165') ).to include_json(
          "year": 2013,
          "make": "Toyota",
          "model": "Avalon"
        )
      end
    end
  end
end
