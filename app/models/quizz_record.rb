class QuizzRecord < ApplicationRecord
  validates :username, presence: true
  validates :length, presence: true
  validates :score, presence: true
  validates :date, presence: true
  validates :correct, presence: true
end
