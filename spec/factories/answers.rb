FactoryBot.define do
  factory :answer do
    answer { "MyString" }
    correct { false }
    question { nil }
  end
end
