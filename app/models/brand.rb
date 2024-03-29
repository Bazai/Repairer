class Brand < ActiveRecord::Base
  has_many :car_models, :dependent => :destroy
  # accepts_nested_attributes_for :car_models
  accepts_nested_attributes_for :car_models, :allow_destroy => true, :reject_if => proc { |a| a[:name].blank? }
end
