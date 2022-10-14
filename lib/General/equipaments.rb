# frozen_string_literal: true

require_relative 'attributes'

# Class base equipamentos
class Equipaments < Attributes::Basic
  attr_reader :name, :type

  attr_reader :genre unless @genre.nil?

  def initialize(**hash)
    @name = hash[:name].to_s
    @type = hash[:type].to_s
    @genre = hash[:genre].to_s unless hash[:genre].nil?
    @level = 0
    super
  end

  def set_attributes
    up_attributes
  end

  def composition(atribute, stone)
    puts @attributes[:"#{atribute}"] += stone
  end
end

weapon = Equipaments.new(name: 'quebra tijolos', type: 'weapon', attack: 10, defense: 8, agility: 9, luck: 7)
weapon.set_attributes
p weapon.attributes
weapon.composition('attack', 10)
p weapon.attributes
