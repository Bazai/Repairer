# encoding: utf-8
class Labor < ActiveRecord::Base
  belongs_to :maintenance
  
  validate :validate_name_uniqueness_inside_maintenance

  def validate_name_uniqueness_inside_maintenance
    self.errors.add(:name, "работы должно быть уникально, в рамках родительского обслуживания") if self.maintenance.has_labor?(self.name)
  end
end
# == Schema Information
#
# Table name: labors
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  description    :string(255)
#  maintenance_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

