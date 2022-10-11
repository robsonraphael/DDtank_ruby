# frozen_string_literal: true

require_relative 'attributes'
require 'securerandom'

# Class base personagem
class Characters < Attributes::Force
  attr_reader :level, :class, :genre, :name

  def initialize(hash)
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
