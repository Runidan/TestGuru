# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
  {login: 'Cozy', password_digest: 'xVA7f%'},
  {login: 'Sprout', password_digest: '9iqX^J'},
  {login: 'Unwrapped', password_digest: 'i$^Yk2'},
  {login: 'Crying', password_digest: 'jmU3W$'},
  {login: 'Filter', password_digest: 'Ws^MH4'}
])


tests = Test.create!([
  {
  title: 'Основные законы логики',
  level: 0, 
  category_id: Category.find_or_create_by!(title: 'Логика').id,
  author_id: User.find_by(login: 'Cozy').id
  },

  {
  title: 'Основы HTML',
  level: 1, 
  category_id: Category.find_or_create_by!(title: 'Информатика').id,
  author_id: User.find_by(login: 'Sprout').id
  },

  {
  title: 'Новый тест',
  level: 2, 
  category_id: Category.find_or_create_by!(title: 'Новая категория').id,
  author_id: User.find_by(login: 'Crying').id
  }
  
])

questions = Question.create!(
    body: 'Истинность мысли по содержанию:',
    test_id: Test.find_by(title: 'Основные законы логики').id,
)

answers = Answer.create!([
  {body: 'актуальность информации, содержащейся в ней',
  question_id: Question.find_by(body: 'Истинность мысли по содержанию:').id
  },

  {body: 'соответствие её действительности',
    question_id: Question.find_by(body: 'Истинность мысли по содержанию:').id,
  correct: true
  },

  {body: 'интерпретация действительности',
   question_id: Question.find_by(body: 'Истинность мысли по содержанию:').id
  },

  {body: 'максимальная приближенность её к действительности',
   question_id: Question.find_by(body: 'Истинность мысли по содержанию:').id
  },
])

questions = Question.create!(
  body: 'Основная ошибка, возникающая при нарушении закона тождества — …',
  test_id: Test.find_by(title: 'Основные законы логики').id,
)

answers = Answer.create!([
  {body: 'Подмена понятия',
  question_id: Question.find_by(body: 'Основная ошибка, возникающая при нарушении закона тождества — …').id,
  correct: true
  },

  {body: 'Паралогизм',
    question_id: Question.find_by(body: 'Основная ошибка, возникающая при нарушении закона тождества — …').id
  },

  {body: 'Тавтология',
  question_id: Question.find_by(body: 'Основная ошибка, возникающая при нарушении закона тождества — …').id
  }
])

questions = Question.create!(
  body: 'Согласно закону тождества всякая мысль в процессе рассуждения …',
  test_id: Test.find_by(title: 'Основные законы логики').id,
)

answers = Answer.create!([
  {body: 'должна быть тождественна самой себе',
  question_id: Question.find_by(body: 'Согласно закону тождества всякая мысль в процессе рассуждения …').id,
  correct: true
  },

  {body: 'должна продолжать предыдущую',
    question_id: Question.find_by(body: 'Согласно закону тождества всякая мысль в процессе рассуждения …').id
  },

  {body: 'должна быть обоснована',
    question_id: Question.find_by(body: 'Согласно закону тождества всякая мысль в процессе рассуждения …').id
  },

  {body: 'не должна противоречить предыдущей',
  question_id: Question.find_by(body: 'Согласно закону тождества всякая мысль в процессе рассуждения …').id
  }
])

records = Record.create!([
  {user_id: 1, test_id: 1},
  {user_id: 2, test_id: 2},
  {user_id: 1, test_id: 2},
  {user_id: 1, test_id: 3}
])

Test.create!(
  title: 'Тест',
  level: 5, 
  category_id: Category.find_by(title: 'Логика').id,
  author_id: User.find_by(login: 'Cozy').id
)