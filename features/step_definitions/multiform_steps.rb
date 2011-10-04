# encoding: utf-8
То /^список "([^"]*)" должен содержать знанчение "([^"]*)"$/ do |field, value|
  find_by_id(field).text.should =~ /#{value}/
end

То /^список "([^"]*)" не должен содержать знанчение "([^"]*)"$/ do |field, value|
  find_by_id(field).text.should_not =~ /#{value}/
end
When /^у меня есть Бренд "([^"]*)"$/ do |name|
  Brand.create!(:name => name)
end