class ProductionYear < ActiveRecord::Base
  belongs_to :car_model
  has_many :maintenances, :dependent => :destroy
  accepts_nested_attributes_for :maintenances, :allow_destroy => true, :reject_if => proc { |a| a[:price].blank? }
  
  
  def edit_header
    self.year.to_s + ", " + self.car_model.brand.name + " " + self.car_model.name
  end
end
