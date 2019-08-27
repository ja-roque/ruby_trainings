FactoryBot.define do
  factory :user_exam do
    score { 1 }
    attempts { 1 }
    time { 1 }
    exam { nil }
    user { nil }
  end
end
