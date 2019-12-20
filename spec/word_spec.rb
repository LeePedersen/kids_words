require 'word'
require 'definition'

describe('#word') do
  before(:each) do
    Word.clear()
    @word1 = Word.new("arbitrary", nil)
    @word2 = Word.new("antithesis", nil)
    @word1.save()
    @word2.save()
    @definition1 = Definition.new("having value", 1)
    @definition2 = Definition.new("random", 1)
    @word1.add_definition(@definition1)
    @word1.add_definition(@definition2)
  end

  describe('#==') do
    it("is the same word if it's spelled the same") do
      word3 = Word.new("arbitrary", nil)
      expect(@word1).to(eq(word3))
    end
  end

  describe(".clear") do
  it("clears all words") do
    Word.clear
    expect(Word.all).to(eq([]))
  end
end

  describe('#save') do
    it('saves a word') do
      expect(Word.all).to(eq([@word1, @word2]))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      expect(Word.find(1)).to(eq(@word1))
    end
  end

  describe('.add_definition') do
    it('saves an array of definitions to a word') do
      expect(@word1.definitions).to(eq([@definition1, @definition2]))
    end
  end

  describe('.edit') do
    it('edits a word') do
      @word1.edit("agnostic")
      expect(@word1.word_name).to(eq("agnostic"))
    end
  end

  describe('.delete_word') do
    it('deletes a word') do
      @word1.delete_word
      expect(Word.all).to(eq([@word2]))
    end
  end

  describe('.delete_def') do
    it('deletes a definition') do
      @word1.delete_def(0)
      expect(@word1.definitions).to(eq([@definition2]))
    end
  end
end
