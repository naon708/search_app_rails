FactoryBot.define do
  factory :dancer do
    japanese_notation { 'アダム・クーパー' }
    universal_notation { 'Adam Cooper' }
    name_order { 'アダムクーパー' }
  end
end
