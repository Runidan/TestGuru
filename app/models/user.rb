# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy


  validates :login, :email, presence: true

  def get_tests_from_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
