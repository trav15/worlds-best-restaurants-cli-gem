class WorldsBestRestaurants::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.theworlds50best.com/list/1-50-winners"))
  end

  def scrape_restaurants_index
<<<<<<< HEAD
     self.get_page.css("div#t1-50 li")
=======
    sleep 5
    self.get_page.css("div#t1-50 li")
>>>>>>> 19f6241c74b8d1480b41ae715e6e2b980eecace6
  end

  def make_restaurants
    scrape_restaurants_index.each do |r|
      WorldsBestRestaurants::Restaurant.new_from_index_page(r)
    end
  end
<<<<<<< HEAD
end
=======
end 
>>>>>>> 19f6241c74b8d1480b41ae715e6e2b980eecace6
