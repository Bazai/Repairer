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
