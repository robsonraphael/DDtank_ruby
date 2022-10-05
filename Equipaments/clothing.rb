#
require './General/Equipaments'
# Class Clothing DDtank
class Clothing < Equipaments::Equipament
  @name = 'Clothing'
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