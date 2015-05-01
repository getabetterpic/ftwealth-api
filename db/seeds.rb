# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FinancialInstitution.create(
  name: 'Capital One 360',
  fid:  '031176110',
  org:  'ING DIRECT',
  url:  'https://ofx.capitalone360.com/OFX/ofx.html',
  sync_class:   'SyncCapitalOne360'
)