require './musix'
require './alchemyapi'
require 'pry'
require 'csv'


class Year
  attr_accessor :init_array, :alchemyapi
  
  def initialize(file_path)
  @init_array = []
  @alchemyapi = AlchemyAPI.new()
  counter = 0
  CSV.foreach(file_path, headers:true) do |row|
      # current = generate_lyrics(row["artist"].downcase, row["track"].downcase)
      current = row['lyrics'].to_s
      counter += 1
      if current != nil && current != ''
         @init_array << [counter,row["year"].to_i,row["artist"].to_s.downcase,row["track"].to_s.downcase,current,generate_sentiment(current)]
      end
    end
  end

  def generate_lyrics(artist, track)
    lyrics = ExtractSongInfo.new(artist, track)
    lyrics.match
    lyrics.lyrics
  end

  def generate_sentiment(input_text)
    response = alchemyapi.sentiment('text', input_text)
    if response['status'] == 'OK'
        return response['docSentiment']['score'].to_f
    else
      return 'Error in sentiment analysis call: ' + response['statusInfo']
    end
  end

  def generate_csv
    CSV.open('definitely_the_final.csv', 'w',) do |csv|
      @init_array.each {|x| 
          csv << [x[0],x[1],x[2],x[3],x[4].gsub(',',''),x[5]]
      }
    end
  end

end