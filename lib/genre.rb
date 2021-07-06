class Genre
    extend Concerns::Findable
    @@all = []
    
    def name=(name)
        @name = name
    end
    
    def name
        @name
    end

    def initialize(name)
        @name = name
        save
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
        new_genre = Genre.new(name)
        new_genre.save
        new_genre
    end

    #association methods
    def songs
        Song.all.select {|song| song.genre == self}
    end

    def artists
        songs.map {|song| song.artist}.uniq    
    end

    
end