class Lesson < ApplicationRecord
  belongs_to :training
  has_one :exam
  has_many :questions
  has_many :contents

  self.inheritance_column = nil
end
