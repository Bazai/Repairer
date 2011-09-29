# encoding: utf-8
Допустим /^есть список автомобилей с годами выпуска:$/ do |table|
  table.hashes.each do |hash|
    brand = Brand.find_by_name(hash[:brand]).nil? ? Brand.create(:name => hash[:brand]) : Brand.find_by_name(hash[:brand])
    car_model = CarModel.find_by_name_and_brand_id(hash[:car_model], brand.id).nil? ? \
      CarModel.create(:name => hash[:car_model], :brand => brand) : \
      CarModel.find_by_name_and_brand_id(hash[:car_model], brand)
    production_year = ProductionYear.create(:year => hash[:production_year], :car_model => car_model)
    # puts Brand.count.to_s + ", " + CarModel.count.to_s + ", " + ProductionYear.count.to_s
  end
end

Допустим /^есть список автомобилей без годов выпуска:$/ do |table|
  table.hashes.each do |hash|
    brand = Brand.find_by_name(hash[:brand]).nil? ? Brand.create(:name => hash[:brand]) : Brand.find_by_name(hash[:brand])
    car_model = CarModel.find_by_name_and_brand_id(hash[:car_model], brand.id).nil? ? \
      CarModel.create(:name => hash[:car_model], :brand => brand) : \
      CarModel.find_by_name_and_brand_id(hash[:car_model], brand)
  end
end

Допустим /^есть список брэндов:$/ do |table|
  table.hashes.each do |hash|
    Brand.create(:name => hash[:name])
  end
  # puts Brand.all.inspect
end

Допустим /^список "([^"]*)"( не)? должен содержать "([^"]*)"(?: within "([^\"]*)")?$/ do |field, negate, value, selector|
  # Webrat решение
  # expectation = negate ? :should_not : :should
  # field_labeled(field).element.search(".//option[text() = '#{value}']").send(expectation, be_present)
  
  # Capybara решение
  with_scope(selector) do
    expectation = negate ? :should_not : :should
    field_labeled(field).first(:xpath, ".//option[text() = '#{value}']").send(expectation, be_present)
  end
end

То /^в списке "([^"]*)" должно быть выбрано "([^"]*)"(?: within "([^\"]*)")?$/ do |field, value, selector|
  with_scope(selector) do
    field_labeled(field).find(:xpath, ".//option[@selected = 'selected'][text() = '#{value}']").should be_present
  end
end

Допустим /^список "([^"]*)"( не)? должен быть отключен$/ do |label, negate|
  element = begin
    find_button(label)
  rescue Capybara::ElementNotFound
    find_field(label)
  end
  ["false", "", nil].send(negate ? :should : :should_not, include(element[:disabled]))
end

Допустим /^я выбираю брэнд "([^"]*)"$/ do |brand|
  Допустим "я перехожу на страницу Эстиматор"
  Допустим "я выбираю значение \"#{brand}\" из списка \"brand_id\""
  Допустим "я кликаю кнопку \"Отправить\""
end



