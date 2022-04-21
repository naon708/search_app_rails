require 'csv'

csv = CSV.read('db/fixtures/csv/steps.csv')
csv[0, 1] = []
csv.each do |step|
  id = step[0]
  japanese_notation = step[1]
  universal_notation = step[2]

  Step.seed do |s|
    s.id = id
    s.japanese_notation = japanese_notation
    s.universal_notation = universal_notation
  end
end

# Run the following
# $ rake db:seed_fu FILTER=production/steps
