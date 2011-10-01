class AdminController < ApplicationController
  # require 'fastercsv'
  require 'csv'

  layout 'admin'
  def index
  end

  def parse_csv
    @loli = []
    if !params[:file].nil?
      # @loli = FasterCSV.new(params[:file].tempfile, :headers => true).each do |row|
      csv = CSV.new(params[:file].tempfile, :headers => true, :col_sep => ";" )
      csv.each do |row|
        # @loli << row["brand"] + " " + row["model"] + " " + row["year"]
        # @loli << row["brand"].to_s + " " + row["model"].to_s + " " + row["year"].to_s
        # brand = Brand.find_by_name(row["brand"])
        brand = Brand.find_by_name(row["brand"]).nil? ? Brand.new(:name => row["brand"].to_s) : Brand.find_by_name(row["brand"].to_s)
        brand.save if brand.valid?
        car_model = CarModel.find_by_name_and_brand_id(row["model"].to_s, brand.id).nil? ? \
                   CarModel.new(:name => row["model"].to_s, :brand => brand) : \
                   CarModel.find_by_name_and_brand_id(row["model"].to_s, brand)
        car_model.save if car_model.valid?
        # production_year = ProductionYear.create(:year => hash[:production_year], :car_model => car_model)
      end
    end
  end
end
