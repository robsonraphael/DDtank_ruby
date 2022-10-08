module Attributes
  # Class Basic Attributes
  class Basic
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
    public :showing_attributes

    def update_attributes(level = @level)
      @attributes[:attack] += (2 + level)
      @attributes[:defense] += (4 + level)
      @attributes[:agility] += (3 + level)
      @attributes[:luck] += (1 + level)
    end
    private :update_attributes
  end

  # Class Force Attributes
  class Force < Basic
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
end
