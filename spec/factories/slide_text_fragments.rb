FactoryBot.define do
  factory :slide_text_fragment do
    text { "MyString" }
    order { 1 }
    slide_text { nil }
  end
end
