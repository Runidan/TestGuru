class User < ApplicationRecord
  has_secure_password

  def tests(level)
    Test.joins("INNER JOIN records ON records.test_id = tests.id AND records.user_id = :id AND tests.level = :level", id:self.id,  level:level)
  end
end
