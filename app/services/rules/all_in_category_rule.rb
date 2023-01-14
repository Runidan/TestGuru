# frozen_string_literal: true

module Rules
  class AllInCategoryRule < Rules::AbstractRule
    def satisfied_by?
      all_test_in_category = Category.find_by!(id: @badge.value).tests.ids # ids тестов нужной категории
      (all_test_in_category - new_passed_test).empty?
    rescue ActiveRecord::RecordNotFound
      false
    end
  end
end
