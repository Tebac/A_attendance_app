class Location < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  belongs_to :user
  
      validates :user_id, presence: true
      validates :location_name, presence: true
      validates :location_type, presence: true, allow_blank: true
      
end

