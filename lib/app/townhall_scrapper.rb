# require 'nokogiri'
# require 'open-uri'


class TownhallScrapper


  #...................................ARDECHE.......................................#

  #DECLARATION DE LA METHODE = SEARCH EMAIL
    def get_email_ardeche (url)
      page = open(url).read
      nokogiri_object = Nokogiri::HTML(page)
      email_ardeche = nokogiri_object.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
      puts email_ardeche.text
      return email_ardeche.text
    end

  #DECLARATION DE LA METHODE = SEARCH NAME
    def get_name_ardeche (url)
      page = open(url).read
      nokogiri_object = Nokogiri::HTML(page)
      name_ardeche = nokogiri_object.xpath("/html/body/div/main/section[1]/div/div/div/h1")
      puts name_ardeche.text
      return name_ardeche.text
    end

  #DECLARATION DE LA METHODE = SEARCH URL
    def get_url_ardeche (url)
      web_links = Nokogiri::HTML(open(url).read)
      web_object = web_links.css("a")
      array = []
      web_object.each {|link| array << link["href"]}
      #grep : isole les elements contenant ces caracteres
      tab = array.grep(/.*07/)
      #construction du nouvel url :
      tab.map {|i| i[0]= "" + "http://annuaire-des-mairies.com"}
      return tab
    end

  #DECLARATION DE LA METHODE = PERFORM
    def perform_ardeche

      tabmail = [] #creation d'array pour le hash
      tabname = [] # //

      # insertion d'elements dans l'array [tabmail]
      get_url_ardeche("http://annuaire-des-mairies.com/ardeche.html").each do |url_town|
          tabmail << get_email_ardeche(url_town)
      end

      # insertion d'elements dans l'array [tabname]
      get_url_ardeche("http://annuaire-des-mairies.com/ardeche.html").each do |url_town|
          tabname << get_name_ardeche(url_town)
      end

      # creation du hash
      my_hash = Hash[tabname.zip(tabmail)]

      @hash_ardeche = Hash.new
      tab_mails = []
      my_hash.each do |key, value|
        index_fin = (key =~ / - /)
        name = key[0...index_fin]
        @hash_ardeche[name] = [07, value]
      end

    end

#...................................DROME.......................................#

#DECLARATION DE LA METHODE = SEARCH EMAIL
  def get_email_drome (url)
    page = open(url).read
    nokogiri_object = Nokogiri::HTML(page)
    email_drome = nokogiri_object.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
    puts email_drome.text
    return email_drome.text
  end

#DECLARATION DE LA METHODE = SEARCH NAME
  def get_name_drome (url)
    page = open(url).read
    nokogiri_object = Nokogiri::HTML(page)
    name_drome = nokogiri_object.xpath("/html/body/div/main/section[1]/div/div/div/h1")
    puts name_drome.text
    return name_drome.text
  end

#DECLARATION DE LA METHODE = SEARCH URL
  def get_url_drome (url)
    web_links = Nokogiri::HTML(open(url).read)
    web_object = web_links.css("a")
    array = []
    web_object.each {|link| array << link["href"]}
    #grep : isole les elements contenant ces caracteres
    tab = array.grep(/.*26/)
    #construction du nouvel url :
    tab.map {|i| i[0]= "" + "http://annuaire-des-mairies.com"}
    return tab
  end

#DECLARATION DE LA METHODE = PERFORM
  def perform_drome

    tabmail = [] #creation d'array pour le hash
    tabname = [] # //

    # insertion d'elements dans l'array [tabmail]
    get_url_drome("http://annuaire-des-mairies.com/drome.html").each do |url_town|
        tabmail << get_email_drome(url_town)
    end

    # insertion d'elements dans l'array [tabname]
    get_url_drome("http://annuaire-des-mairies.com/drome.html").each do |url_town|
        tabname << get_name_drome(url_town)
    end

    # creation du hash
    my_hash = Hash[tabname.zip(tabmail)]

    @hash_drome = Hash.new
    tab_mails = []
    my_hash.each do |key, value|
      index_fin = (key =~ / - /)
      name = key[0...index_fin]
      @hash_drome[name] = [26, value]
    end

  end


#...................................LOT.......................................#


  #DECLARATION DE LA METHODE = SEARCH EMAIL
    def get_email_lot (url)
      page = open(url).read
      nokogiri_object = Nokogiri::HTML(page)
      email_lot = nokogiri_object.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
      puts email_lot.text
      return email_lot.text
    end

  #DECLARATION DE LA METHODE = SEARCH NAME
    def get_name_lot (url)
      page = open(url).read
      nokogiri_object = Nokogiri::HTML(page)
      name_lot = nokogiri_object.xpath("/html/body/div/main/section[1]/div/div/div/h1")
      puts name_lot.text
      return name_lot.text
    end

  #DECLARATION DE LA METHODE = SEARCH URL
    def get_url_lot (url)
      web_links = Nokogiri::HTML(open(url).read)
      web_object = web_links.css("a")
      array = []
      web_object.each {|link| array << link["href"]}
      #grep : isole les elements contenant ces caracteres
      tab = array.grep(/.*46/)
      #construction du nouvel url :
      tab.map {|i| i[0]= "" + "http://annuaire-des-mairies.com"}
      return tab
    end

  #DECLARATION DE LA METHODE = PERFORM
    def perform_lot

      tabmail = [] #creation d'array pour le hash
      tabname = [] # //

      # insertion d'elements dans l'array [tabmail]
      get_url_lot("http://annuaire-des-mairies.com/lot.html").each do |url_town|
          tabmail << get_email_lot(url_town)
      end

      # insertion d'elements dans l'array [tabname]
      get_url_lot("http://annuaire-des-mairies.com/lot.html").each do |url_town|
          tabname << get_name_lot(url_town)
      end

      # creation du hash
      my_hash = Hash[tabname.zip(tabmail)]

      @hash_lot = Hash.new
      tab_mails = []
      my_hash.each do |key, value|
        index_fin = (key =~ / - /)
        name = key[0...index_fin]
        @hash_lot[name] = [46, value]
      end

    end

    #DECLARATION DE LA METHODE = PERFORM GÉNÉRALE
    def perform_all

      all = Hash.new
      all["LOT"] = perform_lot
      all["DROME"] = perform_drome
      all["ARDECHE"] = perform_ardeche

      all

    end


end
