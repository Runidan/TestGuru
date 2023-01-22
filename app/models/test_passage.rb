# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def question_number
    self.test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def success_rate
    (correct_questions.to_f / self.test.questions.count * 100).round
  end

  def successful?
    success_rate >= SUCCESS_RATIO
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def left_time
    self.created_at + self.test.minutes_for_pass * 60 - Time.current if self.test.minutes_for_pass
  end

  private

  def question_number_in_test
    if test.present? && current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_question
    self.current_question = question_number_in_test
  end

  def correct_answer?(answer_ids)
    answer_ids = [] if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
