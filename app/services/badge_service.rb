# frozen_string_literal: true

class BadgeService
  TYPES_AND_METHODS = { badge_category: Rules::AllInCategoryRule,
                        badge_level: Rules::OnFirstTryRule,
                        badge_first_try: Rules::AllOnLevelRule }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def check_badges
    Badge.find_each do |badge|
      @user.badges.push(badge) if matches_to_rule?(badge)
    end
  end

  def matches_to_rule?(badge)
    TYPES_AND_METHODS[badge.badge_type.to_sym].new(badge, @test_passage).satisfied_by?
  end
end
