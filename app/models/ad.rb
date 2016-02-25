class Ad < ActiveRecord::Base

geocoded_by :address
after_validation :geocode, if: :address_changed?

validates :flight_date, :price, :description, :address, presence: true
validates :user_id, presence: true

belongs_to :user

end
