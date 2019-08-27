FactoryBot.define do
  factory :content do
    name { "MyString" }
    type { "" }
    difficulty { "MyString" }
    sequence { 1 }
    lesson { nil }
  end
end
