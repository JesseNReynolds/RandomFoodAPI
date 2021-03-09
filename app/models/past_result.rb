class PastResult < ApplicationRecord
    belongs_to :User, optional: true
    validates :yelp_id, uniqueness: true
end
