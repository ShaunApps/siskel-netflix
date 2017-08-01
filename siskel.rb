require 'httparty'

class Siskel
  attr_reader :title

  def initialize(name)
    @name = HTTParty.get("http://netflixroulette.net/api/api.php?title=#{name}")
    @title = @name['show_title']
  end

end
