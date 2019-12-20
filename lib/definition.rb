class Definition
  attr_accessor :definition, :word_id
  def initialize(definition, word_id)
    @definition = definition
    @word_id = word_id
  end

  def edit(edited)
    @definition = edited
  end
end
