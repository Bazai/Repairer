class Car < ActiveRecord::Base
  belongs_to :brand
end
# == Schema Information
#
# Table name: cars
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  brand_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

