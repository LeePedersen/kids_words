class Definition
  def initialize(attributes)
    @definition = attributes.fetch(:definition, :id, :word_id)
  end
end
