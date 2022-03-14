require 'csv'

csv = CSV.read('db/fixtures/csv/programs.csv')
csv[0, 1] = []
csv.each.with_index(1) do |program, index|
  id = program[0]
  japanese_notation = program[1]
  wikipedia_path = program[2]
  universal_notation = program[3]
  russian_notation = program[4]
  name_order = program[5]

  Program.seed do |s|
    s.id = id
    s.japanese_notation = japanese_notation
    s.wikipedia_path = wikipedia_path
    s.universal_notation = universal_notation
    s.russian_notation = russian_notation
    s.name_order = name_order
  end
end

# Run the following
# $ rake db:seed_fu FILTER=development/programs
