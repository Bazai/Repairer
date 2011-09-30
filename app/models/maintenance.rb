class Maintenance < ActiveRecord::Base
  belongs_to :production_year

  has_many :labors
  has_many :parts
end
