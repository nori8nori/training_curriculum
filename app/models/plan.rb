class Plan < ApplicationRecord
  validates :plan, presence: true #空の場合はDBに保存しないというバリデーションを設定
  validates :date, presence: true #空の場合はDBに保存しないというバリデーションを設定
end
