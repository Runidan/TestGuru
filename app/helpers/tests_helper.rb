# frozen_string_literal: true

module TestsHelper
  def test_level(test)
    case test.level
    when (0..1)
      'simple'
    when (2..4)
      'middle'
    when (5..Float::INFINITY)
      'hard'
    else
      'no level'
    end
  end
end
