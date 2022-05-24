# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs-to :question
end
