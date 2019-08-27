FactoryBot.define do
  factory :content do
    name { "MyString" }
    type { "" }
    difficulty { 1 }
    order { 1 }
    lesson { nil }
  end
end
