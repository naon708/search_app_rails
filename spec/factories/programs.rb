FactoryBot.define do
  factory :program do
    japanese_notation { '白鳥の湖' }
    universal_notation { 'Swan Lake' }
    russian_notation { 'Лебединое озеро' }
    name_order { 'はくちょうのみずうみ' }
    wikipedia_path { '白鳥の湖' }
  end
end
