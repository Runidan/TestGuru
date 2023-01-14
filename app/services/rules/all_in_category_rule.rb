# frozen_string_literal: true

module Rules
  class AllInCategoryRule < Rules::AbstractRule
    def satisfied_by?
      all_test_in_category = Category.find_by(id: @test.category_id).tests.ids # ids тестов нужной категории
      (all_test_in_category - new_passed_test).empty?
    end
  end
end
