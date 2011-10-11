class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :role
  
  attr_accessible :email, :password, :password_confirmation, :role
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  #
  # Пользователь — администратор?
  #
  def admin?
    role = self.try(:role)
    role.try(:name) == "admin"
  end
end
# == Schema Information
#
# Table name: users
#
#  id                           :integer         not null, primary key
#  email                        :string(255)
#  crypted_password             :string(255)
#  salt                         :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  remember_me_token            :string(255)
#  remember_me_token_expires_at :datetime
#  role_id                      :integer
#

