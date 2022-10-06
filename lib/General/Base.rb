# Module Base DDtank
module Base
  # Class Basic Atributes
  class BasicAttributes
    attr_reader :attack, :defense, :agility, :luck

    def initialize(*_args)
      # Atribute Base
      @attack = 1
      @defense = 1
      @agility = 1
      @luck = 1
    end

    def level_up(array = @level)
      @attack += 2 + array[0]
      @defense += 4 + array[1]
      @agility += 3 + array[2]
      @luck += 1 + array[3]
    end
    private :level_up
  end

  # Class Atributes
  class Attributes < BasicAttributes
    attr_reader :damage, :armo, :hp, :strong, :total_force

    def initialize(*args)
      super
      # Atribute Force
      @damage = 1
      @armo = 1
      @hp = 900
      @hp_max = 900
      @strong = 1
      # Force Total
      @total_force = 100
    end

    def level_up(*args)
      return false if @level >= 45

      @level += 1

      super
      @damage = (@luck * @attack) - @defense / 100
      @armo = @defense * @luck
      @hp_max += @level * luck
      @strong = @defense + (@agility * @level)
    end
  end

  # Class Equipaments
  class Equipaments < BasicAttributes
    attr_reader :name, :type, :genre

    def initialize(array)
      @name = array.first
      @type = array[1]
      @level = 0
      super
    end
  end

  # Class Player
  class Character < Attributes
    def initialize(name, genre, type_class)
      # Core
      @name = name.to_s
      @genre = genre.upcase.freeze
      @class = type_class.upcase.freeze
      @level = 1
      @exp = 0
      @exp_max = 10
      # Atributes
      super
    end

    def info
      puts <<~INFO
        ========================
        Nome do personagem: #{@name}
        Gênero: #{@genre}
        Classe: #{@class}
        Nível: #{@level}

        ========================
            A T R I B U T O S
        ========================

        ATAQUE : #{@attack}
        DEFESA : #{@defense}
        AGILIDADE : #{@agility}
        SORTE : #{@luck}

        DANO : #{@damage}
        ARMADURA: #{@armo}
        VIDA : #{@hp_max}
        FORÇA : #{@strong}
      INFO
    end
  end
end