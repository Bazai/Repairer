class Role < ActiveRecord::Base
  has_many :users
end
# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

