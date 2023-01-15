# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  validates :title, presence: true

  has_many :tests, dependent: :destroy

  def this_object
    self
  end
end
