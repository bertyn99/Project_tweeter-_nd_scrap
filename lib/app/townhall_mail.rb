require 'gmail'
require 'dotenv'
require 'json'
Dotenv.load('../../.env')

class Mailer

  def initialize

    @mail = ENV['MAIL']
    @password = ENV['PASSWORD']
    @gmail = Gmail.connect(@mail,@password)
    @file = File.read('../../db/mails.json')

  end

  def send_email(email_adress)
    email = @gmail.compose do
      to email_adress
      subject "Formation gratuite en programmation"
      body "Bonjour,
    Je m'appelle Florian, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

    Déjà 500 personnes sont passées par The Hacking Project. Est-ce que votre mairie veut changer le monde avec nous ?


    Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
    end
    email.deliver! # or: gmail.deliver(email)

  end

  def send_emails_from_json(file = @file)
    data_hash = JSON.parse(file)

    data_hash.each{ |mairie| send_email(mairie["email"])}

  end

  def log_out
    @gmail.logout
  end

end
