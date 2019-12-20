require './lib/definition'

class Word

  attr_accessor :word_name, :id, :definitions

  @@words = {}
  @@increment_id = 0

  def initialize(word_name, id)
    @word_name = word_name
    @id = id || @@increment_id += 1
    @definitions = []
  end

  def save
    @@words[self.id] = Word.new(self.word_name, self.id)
  end

  def self.all
    @@words.values() # alphabetize?
  end

  def self.clear
    @@words = {}
    @@increment_id = 0
  end

  def ==(stage_to_compare)
    self.word_name() == stage_to_compare.word_name()
  end

  def self.find(id)
    @@words[id]
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

  def edit(name)
    @word_name = name
  end

  def delete_word
    @@words.delete(self.id)
  end

  def delete_def(index)
    @definitions.delete_at(index)
  end
end
