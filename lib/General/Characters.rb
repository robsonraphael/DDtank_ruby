require_relative 'Attributes'
require 'securerandom'

# Class Character
class Characters < Attributes::Force
  attr_reader :level

  def initialize(hash)
    # Cores
    @@id = SecureRandom.uuid.freeze
    @name = hash[:name]
    @genre = hash[:genre]
    @class = hash[:class]
    @level = hash[:level] || 1
    # Atributes
    super
  end

  def self.id
    puts "Player ID: #{@@id}"
  end
end