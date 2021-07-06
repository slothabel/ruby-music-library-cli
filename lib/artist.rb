require 'pry'

class Artist
    extend Concerns::Findable
    #artist spec
    @@all = []
    
    def name=(name)
        @name = name
    end
    
    def name
        @name
    end

    def initialize(name)
        @name = name
        #save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end

    def songs # returns the artist's 'songs' collection (artist has many songs)
        Song.all.select {|song| song.artist == self}
    end

   #association spec
   
   def add_song(song)
    if song.no_artist? 
    song.artist = self 
    end
   end

   def genres # returns a collection of genres for all of the artist's songs (artist has many genres through songs) (FAILED - 1
        songs.map {|song| song.genre}.uniq    
    end




   
 end