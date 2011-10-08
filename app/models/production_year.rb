# encoding: utf-8
class ProductionYear < ActiveRecord::Base
  belongs_to :car_model
<<<<<<< HEAD
  
  has_many :maintenances
  
  validates_presence_of :car_model, :on => :create, :message => "наличие модели автомобиля обязательно"
  validate :validate_year_uniqueness_inside_car_model
=======
  has_many :maintenances, :dependent => :destroy
>>>>>>> multiform
  accepts_nested_attributes_for :maintenances, :allow_destroy => true, :reject_if => proc { |a| a[:price].blank? }
  
  def validate_year_uniqueness_inside_car_model
    self.errors.add(:year, "должен быть уникален, в рамках родительской модели автомобиля") if self.car_model.has_production_year?(self.year)
  end
  
  def edit_header
    self.year.to_s + ", " + self.car_model.brand.name + " " + self.car_model.name
  end
end
