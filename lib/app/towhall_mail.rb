require 'gmail'
require 'dotenv'
Dotenv.load
mail = ENV['MAIL']
password = ENV['PASSWORD']
gmail = Gmail.connect(mail,password)

=begin
gmail = Gmail.connect(:xoauth, "thp.acc.tests@gmail.com",
  #:token           => ENV['TOKEN'],
  #:secret          => ENV['TOKEN_SECRET'],
  :consumer_key    => ENV['CONSUMER_KEY'],
  :consumer_secret => ENV['CONSUMER_SECRET']
)
=end

email = gmail.compose do
  to "thp.acc.tests@gmail.com"
  subject "1,2 1,2 this is a test"
  body "Spent the day on the road..."
end
email.deliver! # or: gmail.deliver(email)

gmail.logout
