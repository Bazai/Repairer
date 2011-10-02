# encoding: utf-8
class CarModel < ActiveRecord::Base
  has_many :production_years, :dependent => :destroy
  belongs_to :brand
  
  validates_presence_of :brand, :on => :create, :message => "наличие брэнда обязательно"
  validate :validate_name_uniqueness_inside_brand
  
  accepts_nested_attributes_for :production_years, :allow_destroy => true, :reject_if => proc { |a| a[:year].blank? }
  
  def validate_name_uniqueness_inside_brand
    self.errors.add(:name, "модели должно быть уникально, в рамках родительского брэнда") if self.brand.has_car_model?(self.name)
  end
  
  def before_update
    # puts self.parent.inspect
    self.errors.add(:name, "модели должно быть уникально, в рамках родительского брэнда") if self.brand.has_car_model?(self.name)
    return false if self.errors.count > 0
  end

  def before_create
    self.errors.add(:name, "модели должно быть уникально, в рамках родительского брэнда") if self.brand.has_car_model?(self.name)
    return false if self.errors.count > 0
  end
  
end
