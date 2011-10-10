# encoding: utf-8
class Part < ActiveRecord::Base
  has_and_belongs_to_many :maintenances
  
  validates_uniqueness_of :name
  validates_presence_of :name, :message => "Название не может быть пустым"
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

