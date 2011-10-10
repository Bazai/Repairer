# encoding: utf-8
class AdminController < ApplicationController
  # require 'fastercsv'
  require 'csv'

  layout 'admin'
  def index
    authorize! :index, :admin
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
  
  def parse_maintenance_csv
    if !params[:file].nil?
      @error_array = []
      csv = CSV.new(params[:file].tempfile, :headers => true, :col_sep => ";" )
      
      # TODO удалить нахрен когда закончишь
      # Maintenance.delete_all
      # Labor.delete_all
      # Part.delete_all
      # TODO
      row_number = 0
      
      csv.each do |row|
        debug_row(row)
        
        row_number = row_number + 1
        brand = Brand.find_by_name(row["brand"].strip.to_s)
        if brand.nil? || brand.blank?
          puts "Неизвестный брэнд #{row["brand"]}, сначала создайте такой брэнд. Перехожу к следующей строке."
          @error_array << "Неизвестный брэнд #{row["brand"]}, сначала создайте такой брэнд. Строка #{row_number}."
          next
        end
        
        car_model = CarModel.where("name like ? AND brand_id = ?", row["model"].strip.to_s, brand)
        if car_model.nil? || car_model.blank?
          puts "Неизвестная модель #{row["model"]}, сначала создайте такую модель. Перехожу к следующей строке."
          @error_array << "Неизвестная модель #{row["model"]}, сначала создайте такую модель. Строка #{row_number}."
          next
        end
        
        production_year = ProductionYear.find_by_year_and_car_model_id(row["year"].strip.to_s, car_model)
        if production_year.nil? || production_year.blank?
          puts "Неизвестный год выпуска #{row["model"]} - #{row["year"]}, сначала создайте такой год выпуска. Перехожу к следующей строке."
          @error_array << "Неизвестный год выпуска #{row["model"]} - #{row["year"]}, сначала создайте такой год выпуска. Строка #{row_number}."
          next
        end
        
        maintenance = Maintenance.where("description like ? AND production_year_id = ?",row["maintenance"].strip.to_s, production_year).first
        if maintenance.nil? || maintenance.blank?
          maintenance = Maintenance.new(description: row["maintenance"], mileage: row["maintenance"].to_i, production_year: production_year)
          if maintenance.valid?
            puts "Обслуживание проходит валидацию"
            maintenance.save!
            maintenance.inspect
          else
            puts "Обслуживание не вышло лицом, есть уже такое, скорее всего"
            # puts maintenance.errors.inspect
          end
        else
          puts "Обслуживание успешно нашлось в БД. Радость!"
        end
        
        labor = Labor.where("name like ? AND maintenance_id = ?",row["labor"].strip.to_s, maintenance).first
        if labor.nil? || labor.blank?
          labor = Labor.new(name: row["labor"], description: row["labor"].to_s, maintenance: maintenance)
          if labor.valid?
            puts "Работа проходит валидацию"
            labor.save!
            labor.inspect
          else
            puts "Работа не волк, но в базу ее не добавить. Есть уже такая, скорее всего"
            # puts maintenance.errors.inspect
          end
        else
          puts "Работа успешно нашлась в БД. Радость!"
        end
        
        if has_parts?(row)
          getted_part = get_parts(row)
          part = Part.find_by_name(getted_part)
          if part.nil? || part.blank?
            part = Part.new(name: getted_part, description: getted_part)
            part.save! if part.valid?
          end
          unless part.nil? || part.blank? || maintenance.parts.include?(part)
            maintenance.parts << part
          end
        end
        
        # puts console.log "Brand: #{row["brand"]}, Model: #{row["model"]}" 
      end
    end
  end
  
  def debug_row(row)
    puts "Brand: #{row["brand"]}, Model: #{row["model"]}, Year: #{row["year"]}, " \
         + "Maintenance: #{row["maintenance"]}, Labor: #{row["labor"]}"
    if has_parts?(row)
      part = get_parts(row)
      puts "Parts detected: #{part}" 
    end
    puts "End\n\n"
  end
  
  def has_parts?(row)
    row["labor"].include? "Replace"
  end
  
  def get_parts(row)
    row["labor"].gsub(/Replace\s/, '')
  end
  
end
