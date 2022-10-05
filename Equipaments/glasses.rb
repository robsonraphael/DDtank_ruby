#
require './General/Equipaments'
# Class Glasses DDtank
class Glasses < Equipaments::Equipament
  @name = 'Glasses'
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