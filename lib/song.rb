class Song

    extend Concerns::Findable
    #song spec 
    @@all = []
    
    def name=(name)
        @name = name
    end
    
    def name
        @name
    end

    def initialize(name, artist= nil, genre= nil)
        @name = name
        if artist != nil
            self.artist = artist
        end
        if genre != nil
            self.genre = genre
        end        #binding.pry
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
        new_song = Song.new(name)
        new_song.save
        new_song
    end
    
    #associations spec 

    def artist
        @artist
    end

    def genre
        @genre
    end

    def genre=(genre)
        @genre = genre
    end
    

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def no_artist? #helper method for #add_song
         self.artist == nil ? true : false
    end

    #importer spec
 

    def self.new_from_filename(filename)
        parts = filename.split(" - ")
        artist_name = parts[0]
        song_name = parts[1]
        genre_name = parts[2].chomp(".mp3")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        new(song_name,artist,genre)       # song
    end

    def self.create_from_filename(filename)
       self.new_from_filename(filename).save
    #    binding.pry
    end
    


      

end