class ChaimzService
  def initialize
    @connection = Faraday.new(url: "https://my-chaimz.herokuapp.com/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57" #"Bearer #{ENV[token]}"
  end

  def get_artists
    @connection.get("/api/v1/artists")   #faraday allows ChaimzServiceyou to just pass "/artists"
    @connection.get("/artists")
    # @connection.get("/api/v1/artists?token=#{@user.token}") if you do this, pass a user in the initialize
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def artists_hash
    parse(get_artists)
  end

  def get_artist(id)
    @connection.get "artists/#{id}"
  end

  def artist_hash(id)
    parse(get_artist(id))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true) #symbolize name allows symbols to be passed in instead of strings
  end
end
