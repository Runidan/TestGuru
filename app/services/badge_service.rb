# frozen_string_literal: true

class BadgeService
  TYPES_AND_METHODS = { 'badge_category' => :all_in_category,
                        'badge_level' => :on_first_try,
                        'badge_first_try' => :all_on_level
  }.freeze

  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  def check_badges
    Badge.find_each do |badge|
      @user.badges.push(badge) if matches_to_rule?(badge)
    end
  end

  def matches_to_rule?(badge)
    method(TYPES_AND_METHODS[badge.badge_type]).call(badge)
  end

  private

  def all_in_category?(badge)
    all_test_in_category = Category.find_by(title: badge.value).tests.ids
    passed_test = TestPassage.ids_passed_test(@user)
    (all_test_in_category - passed_test).empty?
  end

  def on_first_try?(badge)
    Test.find_by(title: badge.value).test_passages.where(user: @user).count == 1
  end

  def all_on_level?(badge)
    all_test_onlevel = Test.where(level: badge.value.to_i).ids
    passed_test = TestPassage.ids_passed_test(@user)
    (all_test_onlevel - passed_test).empty?
  end
end
