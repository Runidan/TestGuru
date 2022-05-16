class User < ApplicationRecord
  has_secure_password

  def tests(level)
    Test.where("level = :level AND title = #{self.id}", level: level)
  end
end
