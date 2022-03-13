require 'csv'

csv = CSV.read('db/fixtures/csv/programs.csv')
csv[0, 1] = []
csv.each do |program|
  japanese_notation = program[0]
  wikipedia_path = program[1]
  universal_notation = program[2]
  russian_notation = program[3]
  name_order = program[4]

  Program.seed do |s|
    s.japanese_notation = japanese_notation
    s.wikipedia_path = wikipedia_path
    s.universal_notation = universal_notation
    s.russian_notation = russian_notation
    s.name_order = name_order
  end
end

# Run the following
# $ rake db:seed_fu FILTER=development/programs
