# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    first_words = 'Create new'
    first_words = 'Edit' if question.persisted?

    "#{first_words} question for #{question.test.title} test"
  end
end
