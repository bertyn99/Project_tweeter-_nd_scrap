require 'twitter'
require 'dotenv'
Dotenv.load
class Twitters
  def initialize
    # quelques lignes qui enregistrent les clés d'APIs
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_api_key']
      config.consumer_secret     = ENV['twitter_api_secret']
      config.access_token        = ENV['twitter_token']
      config.access_token_secret = ENV['twitter_token_secret']
    end

    city =JSON.parse(File.read('db/scrapping.json'))#on charge le fichier scrapping.json puis on le parse pour le passe en format ruby
    @twitter_mairie=city.map {|tab|
    	tab.map{ |v| "mairie #{v["name"]}"#on fait un double car c est tableau a 2 dimension et on ajoute mairie au nom de la vile afin de ce rapprocher des handle twitter
    }

    }

     @var=@twitter_mairie.flatten!#transforme le tableau de 3 tableau d annuaire des ville en un seule tableau d'email à une dimension

    
    n = 0 
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
