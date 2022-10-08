require_relative 'Attributes'

# Class Character
class Character < Attributes::Force
  attr_reader :level

  def initialize(hash)
    # Core
    @name = hash[:name]
    @genre = hash[:genre]
    @class = hash[:class]
    @level = hash[:level] || 1
    # Atributes
    super
  end
end
