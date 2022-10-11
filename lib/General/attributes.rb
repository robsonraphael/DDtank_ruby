# frozen_string_literal: true

# Modulo base Atributos

module Attributes
  # Class basica dos atributos
  class Basic
    attr_reader :attributes

    def initialize(*_args)
      @attributes = {
        attack: @attack = 1,
        defense: @defense = 1,
        agility: @agility = 1,
        luck: @luck = 1
      }
    end

    # Metodo atualizar atrubutos
    def up_attributes(level = @level || 1)
      @attributes[:attack] += (1 + level)
      @attributes[:defense] += (2 + level)
      @attributes[:agility] += (2 + level) - (@attack / 2)
      @attributes[:luck] += (1 + level)
    end
    private :up_attributes
  end

  # Class Atributos Personagens
  class Force < Basic
    def initialize(*_args)
      super
      @attributes[:damage] = (@damage = 1)
      @attributes[:armo] = (@armo = 1)
      @attributes[:hp] = (@hp = 1)
      @attributes[:hp_max] = (@hp_max = 900)
      @attributes[:strong] = (@strong = 1)

      # Força total do personagem
      @total_force = 100
    end

    def up_attributes(level = @level || 1)
      super
      @attributes[:damage] += (@attack * 1.5).to_i
      @attributes[:armo] += (@defense * 1.8).to_i
      @attributes[:hp_max] += (level * 5.5).to_i
      @attributes[:strong] += @defense - @agility / 2
    end
    private :up_attributes
  end
end
