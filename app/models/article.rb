class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :question_body, presence: true, length: { maximum: 535 }
  validates :question_answer, presence: true, length: { maximum: 535 }

  belongs_to :user
end
