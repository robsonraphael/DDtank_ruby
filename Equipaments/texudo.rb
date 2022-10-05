#
require './General/Equipaments'
# Class Texudo DDtank
class Texudo < Equipaments::Equipament
  @name = 'Texudo'
  def info
    puts <<~INFO
      ========================
      Equipamento: #{@name}
      ========================
          |  Atributos  |
               .....
      Ataque    =>       #{@atk}
      Defense   =>       #{@def}
      Agility   =>       #{@agi}
      Lyck      =>       #{@luc}
    INFO
  end
end