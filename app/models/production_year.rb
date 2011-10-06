# encoding: utf-8
class ProductionYear < ActiveRecord::Base
  belongs_to :car_model
  
  has_many :maintenances, :dependent => :destroy
  
  validates_presence_of :car_model, :on => :create, :message => "наличие модели автомобиля обязательно"
  validate :validate_year_uniqueness_inside_car_model
  
  accepts_nested_attributes_for :maintenances, :allow_destroy => true, :reject_if => proc { |a| a[:price].blank? }
  
  def validate_year_uniqueness_inside_car_model
    self.errors.add(:year, "должен быть уникален, в рамках родительской модели автомобиля") if self.car_model.has_production_year?(self.year)
  end
  
  def edit_header
    self.year.to_s + ", " + self.car_model.brand.name + " " + self.car_model.name
  end
end
# == Schema Information
#
# Table name: production_years
#
#  id           :integer         not null, primary key
#  year         :integer
#  car_model_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

