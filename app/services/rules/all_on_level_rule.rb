# frozen_string_literal: true

module Rules
  class AllOnLevelRule < Rules::AbstractRule
    def satisfied_by?
      all_test_on_level = Test.where(level: @badge.value).ids # ids тестов нужного уровня
      (all_test_on_level - new_passed_test).empty?
    end
  end
end
