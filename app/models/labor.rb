class Labor < ActiveRecord::Base
  belongs_to :maintenance
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

