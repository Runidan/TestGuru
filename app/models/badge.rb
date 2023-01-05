class Badge < ApplicationRecord
  has_and_belongs_to_many :user

  def discription
    case self.badge_type.to_sym
    when :for_all_in_category then I18n.t(:disc_all_category, category: self.option, scope: 'activerecord.attributes.badge')
    when :on_the_first_try then I18n.t(:disc_on_the_first_try, scope: 'activerecord.attributes.badge')
    when :all_test_one_level then I18n.t(:disc_all_test_one_level, level: self.option, scope: 'activerecord.attributes.badge')
    else
      I18n.t(:no_discription, scope: 'activerecord.attributes.badge')
    end
  end

  def name
    case self.badge_type.to_sym
    when :for_all_in_category then I18n.t(:name_all_category, category: self.option, scope: 'activerecord.attributes.badge')
    when :on_the_first_try then I18n.t(:name_on_the_first_try, scope: 'activerecord.attributes.badge')
    when :all_test_one_level then I18n.t(:name_all_test_one_level, level: self.option, scope: 'activerecord.attributes.badge')
    else
      I18n.t(:no_name, scope: 'activerecord.attributes.badge')
    end
  end
end
