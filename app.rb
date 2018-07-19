require_relative 'lib/app/townhall_follower'
require_relative 'lib/app/townhall_mail'
require_relative 'lib/app/townhall_scrapper'
require_relative 'lib/views/done'

puts "Vous avez le choix entre 3 actions : "
puts "\nTapez 1 pour créer un fichier JSON avec les mails des mairies de 3 départements"
puts "\nTapez 2 pour envoyer des mails de promotion pour THP à ces mairies (le JSON est déjà créé)"
puts "\nTapez 3 pour twitter ces mêmes mairies à propos de THP"
print "> "
input = gets.to_i

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
  Twitter.new
end

Done.new(input).affichage
