# frozen_string_literal: true

require_relative 'attributes'

# Class base equipamentos
class Equipaments < Attributes::Basic
  attr_reader :name, :type

  attr_reader :genre unless @genre.nil?

  def initialize(hash)
    @name = hash[:name].to_s
    @type = hash[:type].to_s
    @genre = hash[:genre].to_s unless hash[:genre].nil?
    super
  end
end
