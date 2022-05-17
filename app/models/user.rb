class User < ApplicationRecord
  has_secure_password

  def tests(level)
    Test.joins("INNER JOIN records ON records.test_id = tests.id AND records.user_id = #{self.id} AND tests.level = #{level}")
  end
end
