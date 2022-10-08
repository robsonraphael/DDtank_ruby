require_relative 'Attributes'

class Equipaments < Atributes::Basic
  def initialize(hash)
    @name = hash[:name]
    @type = hash[:type]
    @genre = hash[:genre] unless hash[:genre].nil?
    super
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
