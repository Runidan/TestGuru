# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  def check_badges
    user_badges = @user.badges
    (Badge.all - user_badges).each do |badge|
      user_badges << badge if check_rule(badge)
    end
  end

  private

  def check_rule(badge)
    badge_methods = { 'badge_category' => :all_in_category?,
                      'badge_first_try' => :on_first_try?,
                      'badge_level' => :all_on_level? }
    method(badge_methods[badge.badge_type]).call
  end

  def all_in_category?
    true
  end

  def on_first_try?
    true
  end

  def all_on_level?
    true
  end
end
