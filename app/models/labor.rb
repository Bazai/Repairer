class Labor < ActiveRecord::Base
  belongs_to :maintenance, :dependent => :destroy
end
