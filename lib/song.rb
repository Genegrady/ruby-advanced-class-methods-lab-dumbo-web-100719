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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
    # binding.pry
    #insinatiates a song with a name property
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song_name| song_name.name == name}
    # binding.pry
  end

  def self.find_or_create_by_name(name)

    self.find_by_name(name) || self.create_by_name(name)

  end

  def self.alphabetical
    @@all.sort_by {|sorted| sorted.name}

    #objects.sort_by {|obj| obj.attribute}
  end

  def self.new_from_filename(file_name)
    song = self.new 
    song.name = (file_name.split(" - ")[1].chomp(".mp3"))
    song.artist_name= (file_name.split(" - ")[0])
    song
    # binding.pry
  end

  def self.create_from_filename(file_name)
    song = self.new 
    song.name = (file_name.split(" - ")[1].chomp(".mp3"))
    song.artist_name= (file_name.split(" - ")[0])
    @@all << song
    song

  end

  def self.destroy_all
    @@all.clear
  end



end
