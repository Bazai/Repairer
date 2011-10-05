# encoding: utf-8
class Brand < ActiveRecord::Base
  has_many :car_models, :dependent => :destroy
  validates_uniqueness_of :name, :on => :create, :message => "Название должно быть уникальным"
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
