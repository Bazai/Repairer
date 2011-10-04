# encoding: utf-8
require 'spec_helper'

describe CarModel do
  it { should respond_to :name     }
  it { should respond_to :brand         }
  it { should respond_to :description    }
end
