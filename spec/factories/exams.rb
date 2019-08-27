FactoryBot.define do
  factory :exam do
    min_score { 1 }
    time_limit { 1 }
    lesson { nil }
  end
end
