# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_and_belongs_to_many :badges

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :login, presence: true, uniqueness: true
  validates :password, confirmation: true

  def get_tests_from_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
