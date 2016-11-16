require 'musix_match'
require 'pry'
MusixMatch::API::Base.api_key = ''

class ExtractSongInfo
  attr_reader :desired_track, :desired_artist, :current_lyric_id
  def initialize(artist, track)
    @desired_artist = artist
    @desired_track = track
  end

  def match
    response = MusixMatch.search_track(:q_artist=> desired_artist, :q_track => desired_track)
    return nil if response.status_code.nil?
    stuff = []
    response.each  do |x| 
      stuff << "#{x.artist_name}: #{x.track_name}: #{x.track_id}"
      @current_lyric_id = x.track_id
    end
    stuff.first
  end

  def lyrics
    response = MusixMatch.get_lyrics(current_lyric_id)
    if response.status_code == 200 && lyrics = response.lyrics
      final_lyrics = lyrics.lyrics_body
    end
    final_lyrics
  end

end











