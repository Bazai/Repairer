class CarModel < ActiveRecord::Base
  has_many :production_years, :dependent => :destroy
  belongs_to :brand
  
  accepts_nested_attributes_for :production_years, :allow_destroy => true, :reject_if => proc { |a| a[:year].blank? }
  
end
