# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :made_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests_users
  has_many :tests, through: :tests_users

  def get_tests_from_level(level)
    tests.where(level:)
  end
end
