require 'twitter'
require 'dotenv'
Dotenv.load
class Twitters
  def initialize
    # quelques lignes qui enregistrent les clés d'APIs
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_api_key']
      config.consumer_secret     = ENV['twitter_api_secret']
      config.access_token        = ENV['twitter_token']
      config.access_token_secret = ENV['twitter_token_secret']
    end

    name =JSON.parse(File.read('db/scrapping.json'))
    @twitter_mairie=name.map {|tab|
    	tab.map{ |v| "mairie#{v["name"]}"
    }

    }

     @var=@twitter_mairie.flatten!

    a=1
    b=2
    n = 0 #position destinataires
    # while a != b
    # 	if n <= 599
    # 		client.update("Bonjour #{@var[n]}")
    # 			n += 1
    # 		sleep 87
    # 		end
    # end

    # while a != b # création d'une boucle infini (condition impossible)

    # 	if n <= 2

    #   		random = rand(0..9) # random entre les 9 phrases
    #   		phrases = [
    # 		"Bonjour #{@pseudotwitter[n]}, je suis élève à The Hacking Project une formation gratuite au code, ceci est un bot Twitter trop cool !",
    # 		"Salut #{@pseudotwitter[n]}, vous connaissez The Hacking Project ? C’est une formation gratuite au code et je vous contacte grâce à un bot !" ,
    # 		"Coucou #{@pseudotwitter[n]}, je vous contacte grâce un bot. Codé grâce à ma formation chez The Hacking project",
    # 		"Hello #{@pseudotwitter[n]}, je vous envois ce message grâce à un bot appris durant ma formation The Hacking project (totalement gratuit!)",
    # 		"#{@pseudotwitter[n]}, ce message est généré par un bot que j'ai appris a coder durant ma formation The Hacking Project",
    # 		"Bonjour #{@pseudotwitter[n]}, je vous présente mon bot twitter, codé durant ma formation The Hacking Project",
    # 		"Salut toi #{@pseudotwitter[n]}, vous connaissez mon bot twitter? Le voici ! Codé durant ma formation The Hacking project, totaly free ",
    # 		"Bonjour #{@pseudotwitter[n]}! Je suis un bot qui te spam par pur plaisir ! Made by The Hacking Project, une formation gratuite",
    # 		"Bot-'Toc toc' #{@pseudotwitter[n]}-'Qui est là?' Bot-'Je suis un bot codé durant une formation The Hacking Procject, totaly free !",
    # 		"Quoi #{@pseudotwitter[n]}, The Hacking Project te parle? Une formation gratuite qui t'apprend par exemple à faire des bots twitters!"]

    #   		client.update(phrases[random])
    #     	n = n + 1
    #     	#sleep 87 #attend 87 secondes entre chaque tweets, pour ne pas dépasser les 100 tweet/h ni 1000 tweet/jour

    # 	else
    # 		n = 1
    # 	end
    #end
    while n==599
    	 	if n <= 599
    			tab_twitter=client.user_search(@var[n])
    				 n += 1

    			if client.user_search(@var[n]).empty?
    				client.update("Bonjour #{tab[0].name}")

    			end
    			n += 1
    		end
    end
  end
end
