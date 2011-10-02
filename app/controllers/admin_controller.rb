class AdminController < ApplicationController
  # require 'fastercsv'
  require 'csv'

  layout 'admin'
  def index
  end

  def parse_csv
    @loli = []
    if !params[:file].nil?
      csv = CSV.new(params[:file].tempfile, :headers => true, :col_sep => ";" )
      csv.each do |row|
        if Brand.where(:name => row["brand"].to_s.strip).first.nil?
          brand = Brand.new(:name => row["brand"].to_s.strip)
          brand.save if brand.valid?
          puts brand.inspect
        else
          brand = Brand.where(:name => row["brand"].to_s.strip).first
          puts brand.inspect
        end
        if CarModel.where("name like ? AND brand_id = ?", row["model"].to_s.strip, brand).first.nil?
          car_model = CarModel.new(:name => row["model"].to_s.strip, :brand => brand)
          car_model.save if car_model.valid?
          puts car_model.inspect
        else
          car_model = CarModel.where("name like ? AND brand_id = ?", row["model"].to_s.strip, brand).first
          puts car_model.inspect
        end
        if ProductionYear.find_by_year_and_car_model_id(row["year"].to_s, car_model.id).nil?
          production_year = ProductionYear.new(:year => row["year"].to_s, :car_model => car_model)
          production_year.save if production_year.valid?
          puts production_year.inspect
        else
          production_year = ProductionYear.find_by_year_and_car_model_id(row["year"].to_s, car_model)
          puts production_year.inspect
        end
      end
    end
  end
end
