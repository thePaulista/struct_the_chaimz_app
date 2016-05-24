class Artist < OpenStruct
#  attr_accessor :id, :name, :created_at, :updated_at

  def self.service
    ChaimzService.new
  end

#  def initialize(new_artist_hash) #the params from the controller
#    @id = new_artist_hash[:id]
#    @name = new_artist_hash[:name]
#    @created_at = new_artist_hash[:created_at]
#    @updated_at = new_artist_hash[:updated_at]
#  end

  def self.find(id)
    artist_hash = ChaimzService.new.artist_hash(id)
    Artist.new(temp_artist_hash)
  end

  def self.all
    temp_artists_hash = service.new.artists_hash
    temp_artist.hash.map do |temp_artist_hash|
      Artist.new(temp_artist_hash)
    end
  end
end
