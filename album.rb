class Album
  attr_accessor :title, :artist, :played

  @@instances = []

  def initialize(title, artist)
    @title = title
    @artist = artist
    @played = false

    @@instances << self
  end

  #marks a given album as played.
  def self.play(title)
    this_album = self.all.select { |album| album.title == title }[0]
    this_album.played = true
    end

  #displays all of the albums in the collection
  def self.all
    @@instances
  end

  #display all of the albums that are of a given played status
  def self.list_all_by_played_status(played=true)
    albums = self.all.select { |album| album.played == played }
  end

  #shows all of the albums in the collection by the given artist
  def self.list_all_by_artist(artist)
    albums = self.all.select { |album| album.artist == artist }
  end


  def self.count
    @@instances.count
  end

end
 

("Ride the Lightning", "Metallica")
("Licensed to Ill", "Beastie Boys")