require_relative 'lib/app/townhall_follower'
require_relative 'lib/app/townhall_mail'
require_relative 'lib/app/townhall_scrapper'
require_relative 'lib/views/done'


puts "Vous avez le choix entre 3 actions : "
puts "\n-> Tapez 1 pour créer un fichier JSON avec les mails des mairies de 3 départements"
puts "\n-> Tapez 2 pour envoyer des mails de promotion pour THP à ces mairies (le JSON est déjà créé)"
puts "\n-> Tapez 3 pour twitter ces mêmes mairies à propos de THP"
print "\n> "
input = gets.to_i

while input != 1 && input != 2 && input != 3
  puts "\n*******************Choix invalide !*******************"
  puts "\nVous avez le choix entre 3 actions : "
  puts "\n-> Tapez 1 pour créer un fichier JSON avec les mails des mairies de 3 départements"
  puts "\n-> Tapez 2 pour envoyer des mails de promotion pour THP à ces mairies (le JSON est déjà créé)"
  puts "\n-> Tapez 3 pour twitter ces mêmes mairies à propos de THP"
  print "\n> "
  input = gets.to_i
end

case input
when 1
  var=Scrapping.new.annuaire_mail_ville("http://www.annuaire-des-mairies.com/var.html")
  morbihan = Scrapping.new.annuaire_mail_ville("http://www.annuaire-des-mairies.com/morbihan.html")
  lozere = Scrapping.new.annuaire_mail_ville("http://www.annuaire-des-mairies.com/lozere.html")
  tab = [var,morbihan,lozere]
  file = File.open("db/scrapping.json","w")
  file.write(JSON.generate(tab))
when 2
  Mailer.new.send_emails_from_json
  Mailer.log_out
when 3
  Twitters.new
end

Done.new(input).affichage
