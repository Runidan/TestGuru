# frozen_string_literal: true

module TestsHelper
  def test_level(test)
    case test.level
    when (0..1) then 'simple'
    when (2..4) then 'middle'
    when (5..Float::INFINITY) then 'hard'
    else
      'no level'
    end
  end
end
