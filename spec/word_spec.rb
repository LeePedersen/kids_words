require 'word'
require 'definition'

describe('#word') do
  before(:each) do
    Word.clear()
    @word1 = Word.new("arbitrary", nil)
    @word1.save()
    @definition1 = Definition.new("having value", 1)
    @word1.add_definition(@definition1)
  end

  describe('#save') do
    it('saves a word') do
      expect(Word.all).to(eq([@word1]))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      expect(Word.find(1)).to(eq(@word1))
    end
  end

  describe('.add_definition') do
    it('saves an array of definitions to a word') do
      expect(@word1.definitions).to(eq([@definition1]))
    end
  end


end
