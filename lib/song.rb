class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(title)
        @name = title
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_data = filename.split(" - ")
        new_song = Song.new(song_data[1])
        new_song.artist = Artist.find_or_create_by_name(song_data[0])
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end