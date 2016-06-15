require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title  
    song
  end

  def self.create_by_name(title)
    song = Song.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(title)
    if self.all.find {|song| song.name == title} == title
      song
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.gsub(".mp3", "").split(" - ")
    artist = song_array[0]
    title = song_array[1]
    song = Song.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song_array = filename.gsub(".mp3", "").split(" - ")
    artist = song_array[0]
    title = song_array[1]
    song = Song.new
    song.name = title
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
