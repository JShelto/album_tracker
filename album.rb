class Album
  attr_accessor :title, :artist, :played

  @@instances = []

  def initialize(title="Untitled", artist="Artist Not Specified")
    @title = title
    @artist = artist
    @played = false

    @@instances << self

    puts "Added \"#{title}\" by \"#{artist}\""
  end


  def self.fabricate(title, artist)
    if album_exists?(title)
      puts "\"#{title}\" already exists"
    else
      new(title, artist)
    end
  end

  def self.remove(title)
    this_album = self.all.select { |album| album.title == title }[0]
    @@instances.delete(this_album)
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
  def self.show_where(played, artist)
    albums = []
    if played.nil? && artist.to_s == ""
      puts "Invalid input"
    else
      if played.nil? #played status unspecifed
        albums = self.all.select { |album| album.artist == artist }
      elsif played == true 
        albums = self.all.select { |album| album.played == true }
        if artist.to_s != ""
          albums = albums.select { |album| album.artist == artist }
        end
      else
        albums = self.all.select { |album| album.played == false }
        if artist.to_s != ""
          albums = albums.select { |album| album.artist == artist }
        end
      end
    end
    if albums.empty?
      puts "No Albums Found"
    else
      albums.each do |album|
        puts album.print_info
      end
    end
  end


  #check @@instances to see if album title exists
  def self.album_exists?(title)
    albums = self.all.select { |album| album.title == title }
    !albums.empty?
  end

  def self.count
    @@instances.count
  end

  #pretty print album info
  def print_info
    "\"#{title}\" by #{artist} (#{played_status})"
  end

  #convert played status from boolean to string
  def played_status
    played ? "played" : "unplayed"
  end
end