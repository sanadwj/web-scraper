require_relative '../lib/searches.rb'

describe Searches do
  let(:input) { Searches.new('developer') }
  context 'initialize' do
    it 'Call the input to creat a file with the input name' do
      expect(input.file.class).to eq(File)
    end
  end
end
