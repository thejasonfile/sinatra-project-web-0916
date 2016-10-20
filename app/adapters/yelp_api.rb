class YelpApi


  def self.client

    @client ||= Yelp::Client.new({ consumer_key: 'tDim-oA5sggT_lV1shpe8g',
                            consumer_secret: 'fxHaI-QTjueMgfrede8x3SFmm5Y',
                            token: 'yugpiz4g7pXYPUekjlCtG1CUC_cvbVWr',
                            token_secret: 'abai6D7EY6SB8lfsvVgIdqRfhX4'
                          })
  end



  def self.search(location, cuisine)
    results = client.search(location, cuisine)
    results.businesses.map do |result|
      Restaurant.create({name: result.name, rating: result.rating, address: result.location.address.join(", ")})
    end
  end
end
