# frozen_string_literal: true

class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :valid_amount

  def valid_amount
    errors.add(:amount_answers, "Amount of anwers to one question must be less 5") if self.question.answers.count > 5
  end

  belongs_to :question

end
