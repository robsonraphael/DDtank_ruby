# frozen_string_literal: true

# Modulo base Atributos

module Attributes
  # Class basica dos atributos
  class Basic
    attr_reader :attributes

    def initialize(**hash)
      @attributes = {
        attack: @attack = hash[:attack] || 1,
        defense: @defense = hash[:defense] || 1,
        agility: @agility = hash[:agility] || 1,
        luck: @luck = hash[:luck] || 1
      }
    end

    # Metodo atualizar atrubutos
    def up_attributes(level = @level)
      @attributes[:attack] += (1 + level)
      @attributes[:defense] += (2 + level)
      @attributes[:agility] += (2 + level) - (@attack / 2)
      @attributes[:luck] += (1 + level)
    end
    private :up_attributes
  end

  # Class Atributos Personagens
  class Force < Basic
    def initialize(**hash)
      super
      @attributes[:damage] = hash[:damage] || 1
      @attributes[:armo] = hash[:armo] || 1
      @attributes[:hp] = hash[:hp] || 1
      @attributes[:hp_max] = hash[:hp_max] || 900
      @attributes[:strong] = hash[:strong] || 1

      # Força total do personagem
      @total_force = hash[:total_foce] || 100
    end

    def up_attributes(**hash)
      @attributes[:damage] = hash[:damage]
      @attributes[:armo] = hash[:armo]
      @attributes[:hp_max] = hash[:hp_max]
      @attributes[:hp] = @attributes[:hp_max]
      @attributes[:strong] = hash[:strong]
    end
    private :up_attributes
  end
end
