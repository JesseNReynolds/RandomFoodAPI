class PastResult < ApplicationRecord
    belongs_to :User, optional: true
    validates :yelp_id, uniqueness: true

    def get_business_info

        url = "https://api.yelp.com/v3/businesses/#{self.yelp_id}"
        raw_query_data = HTTP.auth("Bearer #{ENV["APIKEY"]}").get(url)
        data = JSON.parse(raw_query_data)
        return data
        
    end

end
