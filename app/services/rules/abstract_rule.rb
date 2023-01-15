# frozen_string_literal: true

module Rules
  class AbstractRule
    def initialize(badge, test_passage)
      @badge = badge
      @test_passage = test_passage
      @user = test_passage.user
    end

    def satisfied_by?
      raise NotImplementedError
    end

    private

    def new_passed_test
      # считаем сколько таких же бейджей есть у пользователя
      users_badges = @user.badges.where(id: @badge.id).count
      # ids тестов, которые прошли больше раз, чем users_badges
      test_hash = TestPassage.where(pass: true, user: @user).group(:test_id).count
      test_hash.select { |_key, value| value > users_badges }.keys
    end
  end
end
