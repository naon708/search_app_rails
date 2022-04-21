require 'csv'

csv = CSV.read('db/fixtures/csv/variations.csv')
csv[0, 1] = []
csv.each do |variation|
  id = variation[0]
  variation_program_id = variation[1]
  title = variation[2]
  japanese_notation = variation[3]
  universal_notation = variation[4]

  Variation.seed do |s|
    s.id = id
    s.variation_program_id = variation_program_id
    s.title = title
    s.japanese_notation = japanese_notation
    s.universal_notation = universal_notation
  end
end

# Run the following
# $ rake db:seed_fu FILTER=production/variations
