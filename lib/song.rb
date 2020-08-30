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

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      return Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(song_format)
    song_array = song_format[0..-5].split("-")
    new_song = Song.new
    new_song.name = song_array[1].strip
    new_song.artist_name = song_array[0].strip
    new_song
  end

  def self.create_from_filename(song_format)
    song_array = song_format[0..-5].split("-")
    new_song = Song.new
    new_song.name = song_array[1].strip
    new_song.artist_name = song_array[0].strip
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
