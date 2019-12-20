# require 'rspec'
require 'word'
require 'definition'

describe('#word') do
  before(:each) do
    Word.clear()
    @word1 = Word.new("arbitrary", nil)
    @word1.save()
  end

  describe('#save') do
    it('saves a word') do
      expect(Word.all).to(eq([@word1]))
    end
  end
end
