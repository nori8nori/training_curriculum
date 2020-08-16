class Plan < ApplicationRecord
  validates :plan, presence: true #空のplanができない
  validates :date, presence: true #空のdateができない
end
