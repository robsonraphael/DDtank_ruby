# frozen_string_literal: true

require_relative 'attributes'
require 'securerandom'

# Class base personagem
class Characters < Attributes::Force
  attr_reader :level, :class, :genre, :name

  @id = SecureRandom.uuid.freeze

  def initialize(**hash)
    @name = hash[:name].to_sym
    @genre = hash[:genre][0].to_sym
    @class = hash[:class].to_sym
    @level = hash[:level] || 1
    # Atributes
    super
  end

  def move(direction)
    p "Estou me movendo para a direção #{direction}"
  end

  def attack(target)
    p "Estou atacando #{target}"
  end

  def pass
    p 'Passei meu turno'
  end

  def change_angle(angle)
    p "Angulo: #{angle}º"
  end

  def set_force
    up_attributes
  end
end

bugou = Characters.new(
  name: 'Bugou', genre: 'Feminino', class: 'Warrior', level: 9
)

bugou.set_force
p bugou.attributes

# puts bugou.name
# puts bugou.class
# puts bugou.genre
# puts bugou.level
# p bugou.attributes
