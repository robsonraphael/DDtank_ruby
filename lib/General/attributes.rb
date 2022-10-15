# frozen_string_literal: true

# Modulo base Atributos

module Attributes
  # Class basica dos atributos
  class Basic
    def initialize(level = 1)
      @attack = generate_attribute(0.85, level)
      @defense = generate_attribute(0.90, level)
      @agility = generate_attribute(1, level)
      @luck = generate_attribute(1.25, level)
    end

    def generate_attribute(constante = 1, level = 1)
      return 1 if constante.zero? || level.zero?
      return 1 if level >= 45

      ((constante * level) + Math.exp(level - 1)).floor
    end
    private :generate_attribute

    # Metodo atualizar atributos
    def up_attributes(level = 1)
      @attack += generate_attribute(0.5, level)
      @defense += generate_attribute(0.7, level)
      @agility += generate_attribute(0.8, level)
      @luck += generate_attribute(0.9, level)
    end
    public :up_attributes

    def info
      puts <<~INFO
        Attack: #{@attack}
        Defense: #{@defense}
        Agility: #{@agility}
        Luck: #{@luck}
      INFO
    end
    public :info
  end

  # Class Atributos Personagens
  class Force < Basic
    def initialize(level = 1)
      super
      @damage = generate_attribute(@attack, level)
      @armo = generate_attribute(@defense, level)
      @hp_max = generate_attribute(720, level)
      @hp = @hp_max
      @strong = generate_attribute(@agility, level)

      # Força total do personagem
      @total_force = 1000
    end

    def up_attributes(level = 1)
      super
      @damage = generate_attribute(@attack, level)
      @armo = generate_attribute(@defense, level)
      @hp_max += generate_attribute(20, level)
      @hp = @hp_max
      @strong = generate_attribute(@agility, level)
    end
    public :up_attributes

    def info
      super
      puts <<~INFO
        Damage: #{@damage}
        Armo: #{@armo}
        HP: #{@hp_max}
        Strong: #{@strong}
      INFO
    end
    public :info
  end
end