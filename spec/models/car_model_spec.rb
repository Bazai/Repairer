# encoding: utf-8
require 'spec_helper'

describe CarModel do
  it { should respond_to :name     }
  it { should respond_to :brand         }
  it { should respond_to :description    }
end
# == Schema Information
#
# Table name: car_models
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  brand_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

