class Maintenance < ActiveRecord::Base
  belongs_to :production_year

  has_many :labors
  has_and_belongs_to_many :parts

  accepts_nested_attributes_for :labors, :allow_destroy => true, :reject_if => proc { |a| a[:name].blank? }
  accepts_nested_attributes_for :parts, :allow_destroy => true, :reject_if => proc { |a| a[:name].blank? }


  def header
    self.production_year.edit_header + ", " + self.description
  end
end
