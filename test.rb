require 'minitest/autorun'
require './siskel.rb'

class TestSiskel < Minitest::Test
  def test_movie_title
    movie = Siskel.new("Fargo")
    assert_equal "Fargo", movie.title
  end

  # def test_movie_rating
  #   movie = Siskel.new("Pulp Fiction")
  #   assert_equal "4.1", movie.rating
  # end
  #
  # def test_movie_year
  #   movie = Siskel.new("Breaking Bad")
  #   assert_equal "2008", movie.year
  # end
  #
  # def test_movie_category
  #   movie = Siskel.new("Django Unchained")
  #   assert_equal "Dramas", movie.category
  # end
  #
  # def test_movie_plot
  #   movie = Siskel.new("Mean Girls")
  #   assert_equal "Cady joins her new high school's most powerful clique -- but there's hell to pay when the ex-boyfriend of the clique's leader wants to be Cady's guy.", movie.plot
  # end
  #
  # def test_fake_movie_title
  #   movie = Siskel.new("Walter's Wonderful World, A Very Fake Movie")
  #   assert_equal "Movie not found!", movie.title
  # end


end
