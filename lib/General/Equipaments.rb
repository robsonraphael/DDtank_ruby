require './General/Base'
module Equipaments
  class Weapon < Base::Equipaments
    def info
      puts <<~INFO
        ========================
        Nome da Arma: #{@name}
        Tipo: #{@type}
        Nível: #{@level}

        ========================
            A T R I B U T O S
        ========================

        ATAQUE : #{@attack}
        DEFESA : #{@defense}
        AGILIDADE : #{@agility}
        SORTE : #{@luck}
      INFO
    end
  end
end
