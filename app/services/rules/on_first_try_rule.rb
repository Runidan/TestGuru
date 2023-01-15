# frozen_string_literal: true

module Rules
  class OnFirstTryRule < Rules::AbstractRule
    def satisfied_by?
      user_test_passages = Test.find_by!(title: @badge.value).test_passages.where(user: @user)
      user_test_passages.count == 1 && user_test_passages[0].pass
    rescue ActiveRecord::RecordNotFound
      false
    end
  end
end
