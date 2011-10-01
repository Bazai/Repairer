# encoding: utf-8
class CarModel < ActiveRecord::Base
  has_many :production_years, :dependent => :destroy
  belongs_to :brand
  
  validates_presence_of :brand, :on => :create, :message => "наличие брэнда обязательно"
  
  accepts_nested_attributes_for :production_years, :allow_destroy => true, :reject_if => proc { |a| a[:year].blank? }
end
