class Location < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
      validates :location_name, presence: true, length: { maximum: 15 }, uniqueness: true
      validates :location_type, presence: true, length: { maximum: 10 }
end

