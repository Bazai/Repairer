# encoding: utf-8
# Cписок хэлперов:
# Допустим я на странице *
# Если (я )перехожу на страницу *
# Если (я )перехожу на страницу "*" c "*"
# Если (я )кликаю кнопку "*"
# Если (я )кликаю ссылку "*"
# Если (я )ввожу "*" в поле "*"
# Если (я )ввожу в поле "*" значение "*"
# Если (я )заполняю поля значениями: |...|
# Если (я )выбираю значение "*" из списка "*"
# Если (я )выбираю дату и время "*"
# Если (я )выбираю дату и время "*" в поле "*"
# Если (я )выбираю время "*"
# Если (я )выбираю время "*" в поле "*"
# Если (я )выбираю дату"*"
# Если (я )выбираю дату "*" в поле "*"
# Если (я )устанавливаю галочку "*"
# Если (я )не устанавливаю галочку "*"
# Если (я )выбираю поле "*"
# Если (я )прикрепляю файл "*" в поле "*"
# То (я )должен увидеть текст "*"
# То (я )должен увидеть текст "*" в пределах "*"
# То (я )должен увидеть текст /*/
# То (я )должен увидеть текст /*/ в пределах "*"
# То (на странице )не должно быть текста "*"
# То (на странице )не должно быть текста "*" в пределах "*"
# То (на странице )не должно быть текста /*/
# То (на странице )не должно быть текста /*/ в пределах "*"
# То поле "*" должно содержать "*"
# То поле "*" должно содержать "*"
# То должна быть установлена галочка "*"
# То не должна быть установлена галочка "*"
# То (я )должен оказаться на странице *
# То показать страницу

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Допустим /^я на странице (.+)$/ do |page_name|
  visit path_to(page_name)
end

Если /^(?:|я )перехожу на страницу (.+)$/ do |page_name|
  visit path_to(page_name)
end

Если /^(?:|я )кликаю кнопку "([^\"]*)"$/ do |button|
  click_button(button)
end

Если /^(?:|я )кликаю ссылку "([^\"]*)"$/ do |link|
  click_link(link)
end

Если /^(?:|я )перехожу на страницу "([^\"]*)" с "([^\"]*)"$/ do |link, parent|
  click_link_within(parent, link)
end

Если /^(?:|я )ввожу в поле "([^\"]*)" значение "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Если /^(?:|я )ввожу "([^\"]*)" в поле "([^\"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

# Пример ввода табличных данных:
#
#   Если я заполняю поля значениями:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
Если /^(?:|я )заполняю поля значениями:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

Если /^(?:|я )выбираю значение "([^\"]*)" из списка "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

# Пример ввода даты и времени:
# Если я выбираю дату и время "December 25, 2008 10:00"
Если /^(?:|я )выбираю дату и время "([^\"]*)"$/ do |time|
  select_datetime(time)
end

# Хэлпер для случаев когда на одной странице несколько полей ввода даты и времени, вы должны указать какое поле выбрать:
#   <%= f.label :preferred %>

#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %>

#   <%= f.datetime_select :alternative %>
# Пример ввода нескольких дат и времени:
# Если я выбираю дату и время "November 23, 2004 11:20" в поле "Preferred"
# И я выбираю дату и время "November 25, 2004 10:30" в поле "Alternative"
Если /^(?:|я )выбираю дату и время "([^\"]*)" в поле "([^\"]*)"$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Если я выбираю время "2:20PM"
Если /^(?:|я )выбираю время "([^\"]*)"$/ do |time|
  select_time(time)
end

# Если я выбираю время "7:30AM" в поле "Gym"
Если /^(?:|я )выбираю время "([^\"]*)" в поле "([^\"]*)"$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Если я выбираю дату "February 20, 1981"
Если /^(?:|я )выбираю дату"([^\"]*)"$/ do |date|
  select_date(date)
end

# Если я выбираю дату "April 26, 1982" в поле "Date of Birth"
Если /^(?:|я )выбираю дату "([^\"]*)" в поле "([^\"]*)"$/ do |date, date_label|
  select_date(date, :from => date_label)
end

Если /^(?:|я )устанавливаю галочку "([^\"]*)"$/ do |field|
  check(field)
end

Если /^(?:|я )не устанавливаю галочку "([^\"]*)"$/ do |field|
  uncheck(field)
end

Если /^(?:|я )выбираю поле "([^\"]*)"$/ do |field|
  choose(field)
end

Если /^(?:|я )прикрепляю файл "([^\"]*)" в поле "([^\"]*)"$/ do |path, field|
  type = path.split(".")[1]

  case type
  when "jpg"
    type = "image/jpg"
  when "jpeg"
    type = "image/jpeg"
  when "png"
    type = "image/png"
  when "gif"
    type = "image/gif"
  end
 
  attach_file(field, path, type)
end

То /^(?:|я )должен увидеть текст "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

То /^(?:|я )должен увидеть текст "([^\"]*)" в пределах "([^\"]*)"$/ do |text, selector|
  within(selector) do |content|
    if defined?(Spec::Rails::Matchers)
      content.should contain(text)
    else
      hc = Webrat::Matchers::HasContent.new(text)
      assert hc.matches?(content), hc.failure_message
    end
  end
end

То /^(?:|я )должен увидеть текст \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

То /^(?:|я )должен увидеть текст \/([^\/]*)\/ в пределах "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
    if defined?(Spec::Rails::Matchers)
      content.should contain(regexp)
    else
      assert_match(regexp, content)
    end
  end
end

То /^(?:|на странице )не должно быть текста "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

То /^(?:|на странице )не должно быть текста "([^\"]*)" в пределах "([^\"]*)"$/ do |text, selector|
  within(selector) do |content|
    if defined?(Spec::Rails::Matchers)
      content.should_not contain(text)
    else
      hc = Webrat::Matchers::HasContent.new(text)
      assert !hc.matches?(content), hc.negative_failure_message
    end
  end
end

То /^(?:|на странице )не должно быть текста \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  if defined?(Spec::Rails::Matchers)
    response.should_not contain(regexp)
  else
    assert_not_contain(regexp)
  end
end

То /^(?:|на странице )не должно быть текста \/([^\/]*)\/ в пределах "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
    if defined?(Spec::Rails::Matchers)
      content.should_not contain(regexp)
    else
      assert_no_match(regexp, content)
    end
  end
end

То /^поле "([^\"]*)" должно содержать "([^\"]*)"$/ do |field, value|
  if defined?(Spec::Rails::Matchers)
    field_labeled(field).value.should =~ /#{value}/
  else
    assert_match(/#{value}/, field_labeled(field).value)
  end
end

То /^поле "([^\"]*)" должно содержать "([^\"]*)"$/ do |field, value|
  if defined?(Spec::Rails::Matchers)
    field_labeled(field).value.should_not =~ /#{value}/
  else
    assert_no_match(/#{value}/, field_labeled(field).value)
  end
end

То /^должна быть установлена галочка "([^\"]*)"$/ do |label|
  if defined?(Spec::Rails::Matchers)
    field_labeled(label).should be_checked
  else
    assert field_labeled(label).checked?
  end
end

То /^не должна быть установлена галочка "([^\"]*)"$/ do |label|
  if defined?(Spec::Rails::Matchers)
    field_labeled(label).should_not be_checked
  else
    assert !field_labeled(label).checked?
  end
end

То /^(?:|я )должен оказаться на странице (.+)$/ do |page_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  if defined?(Spec::Rails::Matchers)
    #current_path.should == path_to(page_name)
    path_to(page_name) === current_path.should
  else
    assert_equal path_to(page_name), current_path
  end
end

То /^показать страницу$/ do
  save_and_open_page
end
