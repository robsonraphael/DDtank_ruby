# frozen_string_literal: true

require_relative '../General/characters'
require 'bcrypt'

# Class base Jogador
class Player < Characters
  attr_reader :exp, :exp_for_up

  def initialize(hash)
    super
    @username = hash[:username].freeze
    @password = BCrypt::Password.create(hash[:password])

    @exp = 0
    @exp_max = 0
    @exp_table = []
    @@maximum_level = 45

    set_experience_table
    set_exp_max
  end

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
    @exp_for_up = (@exp_max - @exp)
    true
  end
  private :set_exp_max

  def max_level?
    @level == @@maximum_level
  end
  private :max_level?

  def exp_increase(exp)
    return false if max_level?

    @exp += exp
    level_up if @exp > @exp_max
    true
  end
  public :exp_increase

  def level_up
    @exp = 0
    @level += 1
    @exp_table.delete(@exp_table[@level - 1])
    set_exp_max
    true
  end
  private :level_up
end
