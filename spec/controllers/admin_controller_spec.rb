# encoding: utf-8
require 'spec_helper'

describe AdminController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "#parse_maintenance_csv при обработке файла honda_civic_2000.csv " do
    it "должен показать сообщение об неправильном брэнде в строке 10 " do
      # controller.stub!(:params).and_return({:file => {:tempfile => Rails.root + "/spec/files/honda_civic_2000.csv" }}) [:file].tempfile = Rails.root + "/spec/files/honda_civic_2000.csv"
      file_path = Rails.root.join("/spec/files/honda_civic_2000.csv")
      puts file_path.inspect
      mocked_file = { :tempfile => file_path }
      controller.stub!(:params).and_return(:file => mocked_file)
      post :parse_maintenance_csv
      file = controller.params[:file]
      puts file.inspect
      puts controller.error_array
    end
    
  end

end
