# encoding: utf-8
class Brand < ActiveRecord::Base
  has_many :car_models, :dependent => :destroy
  validates_uniqueness_of :name, :on => :create, :message => "Название должно быть уникальным"
  validates_presence_of :name
  # accepts_nested_attributes_for :car_models
  accepts_nested_attributes_for :car_models, :allow_destroy => true, :reject_if => proc { |a| a[:name].blank? }
  
  # Возвращает true или false, в зависимости от того, есть ли у данного брэнда модель
  # с названием car_model_name
  def has_car_model?(car_model_name)
    arr = []
    self.car_models.each do |car_model|
      arr << car_model.name
    end
    arr.include?(car_model_name)
  end
end
# == Schema Information
#
# Table name: brands
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

