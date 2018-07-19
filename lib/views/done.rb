require_relative '../app/townhall_follower'
require_relative '../app/townhall_mail'
require_relative '../app/townhall_scrapper'

class Done

  def initialize(input)
    @input = input
  end

  def affichage
    case @input
    when 1
      puts "Le fichier JSON est rempli avec les coordonnées de mairies du Var, du Morbihan et de la Lozère, vous pouvez vérifier scrapping.json !"
    when 2
      puts "Des mails ont été envoyés à un maximum de mairies du Var, du Morbihan et de la Lozère !"
    when 3
      puts "Des tweets ont été envoyés aux mairies ayant Twitter et avec un nom normal !"
    end
  end

end
