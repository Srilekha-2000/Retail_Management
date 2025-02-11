#!/bin/env ruby
require 'rails/all'

#ENV['RAILS_ENV'] = "production" # Set to your desired Rails environment name

require "#{Dir.pwd}/config/environment.rb"
require 'roo'
xlsx = Roo::Spreadsheet.open("#{Dir.pwd}/all_script/district.xlsx")

p xlsx.sheets
p "============= creation=========="

header = xlsx.row(1)

xlsx.sheet(0).each_with_index do |data, i|
  row = Hash[[header, data].transpose]
  next if i == 0
  
  district_name = row["dist_name"]
  district_id = row["id"]
  District.find_or_create_by( name: district_name)
  p "Created District #{i}" 
end
