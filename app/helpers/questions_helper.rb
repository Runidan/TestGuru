# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    return 'Edit ' if question.persisted?

    'Create new '
  end
end
