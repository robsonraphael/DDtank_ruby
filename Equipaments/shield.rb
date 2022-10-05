#
require './General/Equipaments'
# Class Shield DDtank
class Shield < Equipaments::Equipament
  @name = 'Shield'
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