class Part < ActiveRecord::Base
  has_and_belongs_to_many :maintenances
end
# == Schema Information
#
# Table name: parts
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

