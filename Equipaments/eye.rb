#
require './General/Equipaments'
# Class Eye DDtank
class Eye < Equipaments::Equipament
  @name = 'Eye'
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