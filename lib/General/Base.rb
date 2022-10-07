# Model Base DDTank
module Base
  # Class Basic Attributes
  class BasicAttributes
    def initialize(*_args)
      @attributes = {
        attack: (@attack = 1), defense: (@defense = 1),
        agility: (@agility = 1), luck: (@luck = 1)
      }
    end

    # Mostrar Atributos
    def showing_attributes
      puts '======================='
      @attributes.each_pair { |key, value| puts "#{key} => #{value}" }
      puts '======================='
    end
    private :showing_attributes

    def update_attributes
      @attributes[:attack] += (2 + @level)
      @attributes[:defense] += (4 + @level)
      @attributes[:agility] += (3 + @level)
      @attributes[:luck] += (1 + @level)
    end
    private :update_attributes
  end

  # Class Atributes
  class Attributes < BasicAttributes
    def initialize(*args)
      super
      @attributes[:damage] = (@damage = 1)
      @attributes[:armo] = (@armo = 1)
      @attributes[:hp] = (@hp = 1)
      @attributes[:hp_max] = (@hp_max = 900)
      @attributes[:strong] = (@strong = 1)

      # Force Total
      @total_force = 100
    end

    def update_attributes
      super
      @attributes[:damage] += (@luck * @attack)
      @attributes[:armo] += (@defense * @luck)
      @attributes[:hp_max] += (@level * @luck)
      @attributes[:strong] += (@defense + (@agility * @level))
    end
    private :update_attributes
  end

  # Class Equipaments
  class Equipaments < BasicAttributes
    def initialize(hash)
      @name = hash[:name]
      @type = hash[:type]
      @genre = hash[:genre] unless hash[:genre].nil?
      @level = 0
      super
    end

    def level_up
      return false if @level >= 12

      @level += 1
      update_attributes
    end

    def info
      puts <<~INFO
        =======================
          E Q U I P A M E N T
        =======================
        NAME: #{@name}
        TIPO: #{@type}
        GENRE: #{@genre}
        LEVEL: #{@level}
      INFO
      showing_attributes
    end
  end

  # Class Characte
  class Character < Attributes
    def initialize(hash)
      # Core
      @name = hash[:name]
      @genre = hash[:genre]
      @class = hash[:class]
      @level = 1
      # Atributes
      super
    end

    def level_up
      return false if @level >= 45

      @level += 1
      update_attributes
    end
  end
end