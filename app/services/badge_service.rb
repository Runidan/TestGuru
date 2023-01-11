# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  def check_badges
    Badge.find_each do |badge|
      @user.badges.push(badge) if matches_rules?(badge)
    end
  end

  private

  def matches_rules?(badge)
    rule_methods = [:all_in_category, :on_first_try, :all_on_level]
    rule_methods.any? { |rule_method| method(rule_method).call(badge) }
  end

  def all_in_category?(badge)
    if badge.badge_type == 'badge_category'
      all_test_in_category = Category.find_by(title: badge.value).tests.ids
      passed_test = TestPassage.ids_passed_test(@user)
      (all_test_in_category - passed_test).empty?
    else
      false
    end
  end

  def on_first_try?(badge)
    if badge.badge_type == 'badge_first_try'
      Test.find_by(title: badge.value).test_passages.where(user: u).count == 1
    else
      false
    end
  end

  def all_on_level?(badge)
    if badge.badge_type == 'badge_level'
      all_test_onlevel = Test.where(level: badge.value.to_i).ids
      passed_test = TestPassage.ids_passed_test(@user)
      (all_test_onlevel - passed_test).empty?
    else
      false
    end
  end
end
