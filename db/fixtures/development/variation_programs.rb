require 'csv'

csv = CSV.read('db/fixtures/csv/variation_programs.csv')
csv[0, 1] = []
csv.each.with_index(1) do |variation_program, index|
  id = variation_program[0]
  name = variation_program[1]

  VariationProgram.seed do |s|
    s.id = id
    s.name = name
  end
end

# Run the following
# $ rake db:seed_fu FILTER=development/variation_programs
