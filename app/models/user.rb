# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :made_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy

  validates :login, :email, presence: true

  def get_tests_from_level(level)
    tests.by_level(level)
  end
end
