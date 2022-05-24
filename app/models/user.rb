# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :tests

  def tests(level)
    Test
      .joins('INNER JOIN records ON records.test_id = tests.id')
      .where(records: { user_id: id }, level:)
  end
end
