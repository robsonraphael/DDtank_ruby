require_relative '../General/Characters'

class Player < Characters
  attr_reader :name, :exp

  def initialize(hash)
    super
    @username = [:username]
    @password = [:password]

    @exp = 0
    @exp_max = 0
    @exp_table = []

    set_maximum_level
    set_experience_table
    set_exp_max
  end

  def set_maximum_level(level = 45)
    @@maximum_level = level.to_i.freeze
  end
  private :set_maximum_level

  def set_experience_table
    @exp_table = Array.new((@@maximum_level - 1))
    for i in (1..@@maximum_level).to_a
      @exp_table[i - 1] = (Math.exp(i).to_i * @@maximum_level) / Math.log(@@maximum_level).to_i
    end
    @exp_table
  end
  private :set_experience_table

  def exp_required_for_level(level)
    @exp_table[level]
  end
  private :exp_required_for_level

  def calculate_required_exp(from_level = @level, to_level)
    results = []
    (from_level..to_level).each do |level|
      results << exp_required_for_level(level)
    end
    p "Para o Nível #{to_level} você precisa de #{results.reduce(:+)} pontos de exp"
  end
  public :calculate_required_exp

  def set_exp_max
    return false if max_level?

    @exp_max = @exp_table[@level - 1]
    true
  end
  private :set_exp_max

  def status
    puts <<~INFO
      ======================================================
      Nível: #{@level}
      Experiencia Atual: #{@exp}
      Experiencia Para o proximo nivel: #{@exp_max - @exp}
    INFO
    showing_attributes
  end
  public :status

  def max_level?
    @level == @@maximum_level
  end
  private :max_level?

  def increase_exp(exp)
    return false if max_level?

    @exp += exp
    level_up if @exp > @exp_max
    true
  end
  public :increase_exp

  def decrease_exp(exp)
    @exp -= exp
  end
  private :decrease_exp

  def level_up
    decrease_exp(@exp_max)
    @level += 1
    @exp_table.delete(@exp_table[@level - 1])
    set_exp_max
    true
  end
  private :level_up
end