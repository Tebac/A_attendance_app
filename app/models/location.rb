class Location < ApplicationRecord
    
      validates :location_name, presence: true
      validates :location_type, presence: true
      
end
