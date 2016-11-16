require 'minitest/autorun'
require 'minitest/pride'
require_relative 'musix'
require_relative 'year'

class MusixTest < Minitest::Test 
  def test_that_search_for_existing_song_can_find_self
    stuff = ExtractSongInfo.new("Queen", "Bohemian Rhapsody")
    assert_equal "Queen: Bohemian Rhapsody: 85218011", stuff.match
  end

  def test_that_search_for_nonexisting_song_returns_nil
    stuff = ExtractSongInfo.new("blahblachblach", ";lasdfdjskfl")
    assert_equal nil, stuff.match
  end

  def test_that_search_for_existing_song_returns_lyrics
    stuff = ExtractSongInfo.new("Queen", "Bohemian Rhapsody")
    stuff.match
    result = stuff.lyrics
    assert_equal "Is this the real life?", result[0..21]
  end

  def test_that_array_is_created_from_string
    go = Year.new("./song_data.csv")
    assert_equal 5, go.init_array.count
  end

  def test_that_lyrics_from_a_song_are_returned
    go = Year.new("./song_data.csv")
    assert_equal "Is this the real life?", go.init_array
  end

  def test_that_csv_line_is_generated
    go = Year.new("./data/song_data.csv")
    go.init_array
    assert_equal "", go.generate_csv
  end
end