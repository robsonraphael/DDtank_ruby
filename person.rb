# Classe Character
class Character
  private

  def create_character
    loop do
      print 'Gênero do personagem [M/F]: '
      puts @genre = gets.chomp.upcase
      break if @genre == 'F' || @genre == 'M'
    end

    loop do
      print 'Digite o nome do personagem [Minimo, 5 character]: '
      @name = gets.chomp.to_sym
      break if !@name.nil? && @name.length > 4
    end
  end

  def initialize
    puts 'Criação de personagem...'
    create_character

    puts 'Criando seus atributos de batalha...'
    @attak = 1, @defense = 1, @agility = 1, @luck = 1

    puts 'Criando seus atributos principais...'
    @@damage = 1, @@protect = 1, @@life = 1, @@strong = 1
    
    # Getters Methods
    attr_reader :attack, :defense, :agility, :luck

    # Setters Methods
    attr_writer :attack, :defense, :agility, :luck
  end
end

raphael = Character.new
