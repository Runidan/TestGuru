# frozen_string_literal: true

class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  belongs_to :question

  validates :body, presence: true
  validate :valid_amount, on: %i[save save! create create! valid? invalid?]

  private

  def valid_amount
    errors.add(:amount_answers, 'Amount of anwers to one question must be less 5') if question.answers.count > 5
  end
end
