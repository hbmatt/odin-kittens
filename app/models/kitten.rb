class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :cuteness, presence: true, length: { in: 1..10 }
  validates :softness, presence: true, length: { in: 1..10 }
end
