# frozen_string_literal: true

class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  belongs_to :question
end
