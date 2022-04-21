require 'csv'

csv = CSV.read('db/fixtures/csv/dancers.csv')
csv[0, 1] = []
csv.each do |dancer|
  id = dancer[0]
  japanese_notation = dancer[1]
  name_order = dancer[2]
  universal_notation = dancer[3]
  russian_notation = dancer[4]

  Dancer.seed do |s|
    s.id = id
    s.japanese_notation = japanese_notation
    s.universal_notation = universal_notation
    s.russian_notation = russian_notation
    s.name_order = name_order
  end
end

# Run the following
# $ rake db:seed_fu FILTER=production/dancers
