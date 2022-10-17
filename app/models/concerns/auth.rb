# frozen_string_literal: true

module Auth
  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :login, :email, presence: true
    validates :password, presence: true, if: proc { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    else
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
