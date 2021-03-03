require_relative '../../APIKey.rb'
class YelpQuery

    attr_accessor :limit, :category, :longitude, :latitude,
    :radius, :results, :open_boolean

    def initialize(latitude:, longitude:, radius:, open_boolean:)
        @limit = 50 
        # max limit the api supports as of 10/19/20 is 50
        @category = "Restaurants"
        @longitude = longitude
        @latitude = latitude  
        @open_boolean = open_boolean

        if (radius.to_i * 1609.34).to_i < 40000
            @radius = (radius.to_i * 1609.34).to_i
        else 
            @radius = 40000
        end

        @results = []
    end

    def compile_results
        results = 50
        offset = 0
        while offset < results && offset <= 999 do
            # yelp limits total iteratively returned results to 1000
            url = "https://api.yelp.com/v3/businesses/search?limit=#{@limit}&category=#{@category}&latitude=#{@latitude}&longitude=#{@longitude}&radius=#{@radius}&open_now=#{@open_boolean}&price=1,2,3,4&offset=#{offset}"
            raw_query_data = HTTP.auth("Bearer #{$APIKEY}").get(url)
            data = JSON.parse(raw_query_data)
            results = data["total"]
            offset += 50
            @results = @results + data["businesses"]
        end
        
    end

end
