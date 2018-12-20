class Album
  attr_accessor :title, :artist, :played

  @@instances = []

  def initialize(title, artist)
    @title = title
    @artist = artist
    @played = false

    @@instances << self

    puts "Added \"#{title} by #{artist}"
  end

  #marks a given album as played.
  def self.play(title)
    this_album = self.all.select { |album| album.title == title }[0]

    if this_album.nil?
      puts "\"#{title}\" not found"
    else
      this_album.played = true

      puts "You\'re listening to \"#{title}\""
    end
  end

  #displays all of the albums in the collection
  def self.all
    albums = @@instances
  end

  #displays all albums
  def self.show_all
    self.all.each do |album|
      puts album.print_info
    end
  end

  #returns albums of a given played status, and those by a given artist if specified
  def self.show_all_by(played=true, artist=nil)
    albums = self.all.select { |album| album.played == played }
    unless artist == nil
      albums = albums.select { |album| album.artist == artist }
    end
    albums.each do |album|
      puts album.print_info
    end
  end

  def self.count
    @@instances.count
  end

  def print_info
    "\"#{title}\" by #{artist} (#{played_status})"
  end

  def played_status
    played ? "played" : "unplayed"
  end
end