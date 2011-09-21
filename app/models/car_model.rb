class CarModel < ActiveRecord::Base
  has_many :production_years
  belongs_to :brand
end
