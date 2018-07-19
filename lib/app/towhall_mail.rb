require 'gmail'
require 'dotenv'
Dotenv.load


mail = ENV['MAIL']
password = ENV['PASSWORD']
gmail = Gmail.connect(mail,password)

=begin
gmail = Gmail.connect(:xoauth, mail,
  #:token           => ENV['TOKEN'],
  #:secret          => ENV['TOKEN_SECRET'],
  :consumer_key    => ENV['CONSUMER_KEY'],
  :consumer_secret => ENV['CONSUMER_SECRET']
)
=end

email = gmail.compose do
  to "thp.acc.tests@gmail.com"
  subject "Formation gratuite en programmation"
  body "Bonjour,
Je m'appelle Florian, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de [NOM_COMMUNE] veut changer le monde avec nous ?


Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
end
email.deliver! # or: gmail.deliver(email)

gmail.logout
