# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    return "Edit #{question.test.title} Question" if question.persisted?

    "Create New #{question.test.title} Question"
  end
end
