
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

class Scrapping

  def initialize(*url_department)
    @url_department = url_department
    @hash = []
  end

  def get_the_email_of_a_townhal_from_its_webpage(url)

    page = Nokogiri::HTML(open(url))
	  return   page.css('td')[7].text

  end

  def get_the_CP_of_a_townhal_from_its_webpage(url)

    page = Nokogiri::HTML(open(url))
  	return   page.css('td')[11].text

  end

  def get_all_the_urls_of_townhalls(page_url)

    page = Nokogiri::HTML(open(page_url))
    ville = page.css('p>a').map {|ville| ville.text}
    link = page.css('p>a').map {|vill| vill['href']}
    return [ville,link]

  end

  def annuaire_mail_ville(urls)

  	i=0

    array = get_all_the_urls_of_townhalls(urls)

  	@villes=array[0]
  	@cp=array[1].map{ |url| get_the_CP_of_a_townhal_from_its_webpage("http://www.annuaire-des-mairies.com/#{url}") }

  	@email = array[1].map{ |url| get_the_email_of_a_townhal_from_its_webpage("http://www.annuaire-des-mairies.com/#{url}") }

  	@villes.length.times do
  		@hash += [{ "name" => @villes[i], "email" => @email[i], "cp" => @cp[i]}]
  		i += 1
  	end
  	return @hash
  end

end
