class WorldsBestRestaurants::Restaurant

  attr_accessor :name, :position, :location, :url, :head_chef, :website_url, :food_style, :best_dish, :contact, :description

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("h2").text,
      "http://www.theworlds50best.com#{r.css("a").attribute("href").text}",
      r.css("h3").text,
      r.css(".position").text
      )
  end


  def initialize(name=nil, url=nil, location=nil, position=nil)
    @name = name
    @url = url
    @location = location
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def best_dish
    @best_dish ||= doc.css("div.c-4.nr.nt ul:nth-child(8) li").text
  end

  def food_style
    binding.pry
    @food_style ||= doc.css("div.c-4.nr.nt ul:nth-child(6) li").text
  end

  def contact
    @contact ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(1)").text.split("+").join(". Tel: +")
  end

  def head_chef
    @head_chef ||= doc.css("div.c-4.nr.nt ul:nth-child(3) li").text.split(" (pictured)").join("")
  end

  def website_url
    @website_url ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(2) a").text
  end

  def description
    @description ||= doc.css("div.c-8.nl.nt > p:nth-child(6)").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
