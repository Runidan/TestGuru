# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, presence: true
  validates :user, presence: true
  validates :question, presence: true
  validates :name, presence: true
end
