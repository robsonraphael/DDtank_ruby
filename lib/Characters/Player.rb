require_relative '../General/Characters'

class Player < Character
  def initialize(*args)
    super
    @exp = 0
    @exp_max = 0
    @exp_table = []
  end

  def level_max(level)
    @level_max = level.freeze
  end
  public :level_max

  def set_exp_table(*args)
    @exp_table = Array.new(@level_max, 1)

    @exp_table.each_with_index do |_element, index|
      @exp_table[index] = *args[index]
    end
    @exp_table.flatten!.freeze
  end
  public :set_exp_table

  def exp_required_for_level(level)
    @exp_table[level - @level - 1]
  end
  public :exp_required_for_level

  def calculate_required_exp(from_level, to_level)
    results = []

    (from_level..to_level).each do |level|
      results.push(exp_required_for_level(level))
    end
    results.flatten!
    value = 0
    results.each { |e| value += e }

    value
  end
  public :calculate_required_exp

  def set_exp_max
    @exp_max = @exp_table[@level - 1]
  end
  private :set_exp_max

  def exp_status
    puts "Nível: #{@level}"
    puts "Experiencia Atual: #{@exp}"
    puts "Experiencia Para o proximo nivel: #{@exp_max - @exp}"
  end
  public :exp_status

  def max_level?
    @level == @level_max
  end
  private :max_level?

  def increase_exp(exp)
    @exp += exp
    @exp_max = @exp_table[0] if @level == 1
    level_up if @exp >= @exp_max
  end
  public :increase_exp

  def decrease_exp(exp)
    @exp -= exp
  end
  private :decrease_exp

  def level_up
    decrease_exp(@exp_max)
    @level += 1
    set_exp_max
  end
  private :level_up

  def movement(direction)
    case direction
    when 'left'
      puts 'Andando para esquerda'
    when 'right'
      puts 'Andando para direita'
    end
  end
  public :movement

  def angle(direction)
    case direction
    when 'up'
      puts "Subindo o angulo..."
    when 'down'
      puts "Descendo o angulo..."
    end
  end
  public :angle
end