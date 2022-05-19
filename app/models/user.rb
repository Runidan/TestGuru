class User < ApplicationRecord
  has_secure_password

  def tests(level)
    Test
      .joins("INNER JOIN records ON records.test_id = tests.id")
      .where(records: {user_id: self.id} level: level)
  end
end
