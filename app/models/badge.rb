class Badge < ApplicationRecord
  has_and_belongs_to_many :user

  DISCRIPTIONS = {
    for_all_in_category: "Badge for all test in #{@option} Category",
    on_the_first_try: "Badge on the first try",
    all_test_one_level: "Badge for all test on level #{@option}"
  }

  def discription
    DISCRIPTIONS[self.badge_type.to_sym]
  end
end
