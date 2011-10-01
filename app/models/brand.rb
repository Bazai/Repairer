# encoding: utf-8
class Brand < ActiveRecord::Base
  has_many :car_models, :dependent => :destroy
  validates_uniqueness_of :name, :on => :create, :message => "Название должно быть уникальным"
  # accepts_nested_attributes_for :car_models
  accepts_nested_attributes_for :car_models, :allow_destroy => true, :reject_if => proc { |a| a[:name].blank? }
end
