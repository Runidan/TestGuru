class Badge < ApplicationRecord
  has_and_belongs_to_many :user
  has_one :category, class_name: "category", foreign_key: "category_id"
  has_one :test

  def name
    case self.badge_type.to_sym
    when :for_all_in_category then I18n.t(:name_all_category, scope: 'activerecord.attributes.badge')
    when :on_the_first_try then I18n.t(:name_on_the_first_try, scope: 'activerecord.attributes.badge')
    when :all_test_one_level then I18n.t(:name_all_test_one_level, level: self.option, scope: 'activerecord.attributes.badge')
    else
      I18n.t(:no_name, scope: 'activerecord.attributes.badge')
    end
  end

  def discription
    category = Category.find(1).title
    case self.badge_type.to_sym
    when :for_all_in_category then I18n.t(:disc_all_category, category: category, scope: 'activerecord.attributes.badge')
    when :on_the_first_try then I18n.t(:disc_on_the_first_try, scope: 'activerecord.attributes.badge')
    when :all_test_one_level then I18n.t(:disc_all_test_one_level, level: self.option, scope: 'activerecord.attributes.badge')
    else
      I18n.t(:no_discription, scope: 'activerecord.attributes.badge')
    end
  end

  def label_option
    "Описание опций"
  end
end
