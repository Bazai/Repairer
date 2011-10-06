# encoding: utf-8
class Maintenance < ActiveRecord::Base
  belongs_to :production_year

  has_many :labors, :dependent => :destroy
  has_and_belongs_to_many :parts

  accepts_nested_attributes_for :labors, :allow_destroy => true, :reject_if => proc { |a| a[:name].blank? }
  accepts_nested_attributes_for :parts, :allow_destroy => true, :reject_if => proc { |a| a[:name].blank? }
  
  validate :validate_description_uniqueness_inside_production_year


  def validate_description_uniqueness_inside_production_year
    self.errors.add(:description, "обслуживания должно быть уникально, в рамках родительского года выпуска") if self.production_year.has_maintenance?(self.description)
  end

  def header
    self.production_year.edit_header + ", " + self.description
  end
end
# == Schema Information
#
# Table name: maintenances
#
#  id                 :integer         not null, primary key
#  description        :string(255)
#  price              :integer
#  production_year_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#  mileage            :integer
#

