# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

District.create chi_name: "中西區", eng_name: "Central/Western"#, type: 1
District.create chi_name: "東區", eng_name: "Eastern"#, type: 1
District.create chi_name: "觀塘", eng_name: "Kwun Tong"#, type: 1
District.create chi_name: "深水埗", eng_name: "Sham Shui Po"#, type: 1
District.create chi_name: "葵涌", eng_name: "Kwai Chung"#, type: 1
District.create chi_name: "荃灣", eng_name: "Tsuen Wan"#, type: 1
District.create chi_name: "元朗", eng_name: "Yuen Long"#, type: 1
District.create chi_name: "屯門", eng_name: "Tuen Mun"#, type: 1
District.create chi_name: "東涌", eng_name: "Tung Chung"#, type: 1
District.create chi_name: "大埔", eng_name: "Tai Po"#, type: 1
District.create chi_name: "沙田", eng_name: "Sha Tin"#, type: 1
District.create chi_name: "塔門", eng_name: "Tap Mun"#, type: 1

District.create chi_name: "銅鑼灣", eng_name: "Causeway Bay"#, type: 2
District.create chi_name: "中環", eng_name: "Central"#, type: 2
District.create chi_name: "旺角", eng_name: "Mong Kok"#, type: 2
