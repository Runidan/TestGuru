# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true, if: proc { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  def get_tests_from_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
