# Module Characters DDtank
module Characters
  # Class Character
  class Character
    def initialize(name, gender)
      @name = name
      @gender = gender
    end

    def info
      puts "Nome: #{@name}"
      puts "Genero: #{@gender}"
    end
  end
end
