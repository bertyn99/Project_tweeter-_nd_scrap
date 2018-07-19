require 'twitter'
require 'dotenv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['twitter_api_key']
  config.consumer_secret     = ENV['twitter_api_secret']
  config.access_token        = ENV['twitter_token']
  config.access_token_secret = ENV['twitter_token_secret']
end

name =JSON.parse(File.read('../../db/scrapping.json'))
@twitter_mairie=name.map {|tab|
	tab.map{ |v| "mairie#{v["name"]}"
}

}

 @var=@twitter_mairie.flatten!
   
a=1
b=2
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


    
 