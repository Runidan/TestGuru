# frozen_string_literal: true

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { login: 'Cozy', password_digest: 'xVA7f%' },
                       { login: 'Sprout', password_digest: '9iqX^J' },
                       { login: 'Unwrapped', password_digest: 'i$^Yk2' },
                       { login: 'Crying', password_digest: 'jmU3W$' },
                       { login: 'Filter', password_digest: 'Ws^MH4' }
                     ])

category = Category.create!([
                              { title: 'Логика' }, { title: 'Информатика' }, { title: 'Новая категория' }
                            ])

tests = Test.create!([
                       { title: 'Основные законы логики',
                         level: 0,
                         category_id: category[0].id,
                         author_id: users[0].id },
                       { title: 'Основы HTML',
                         level: 1,
                         category_id: category[1].id,
                         author_id: users[0].id },
                       { title: 'Новый тест',
                         level: 2,
                         category_id: category[2].id,
                         author_id: users[0].id }
                     ])

question = Question.create!(
  body: 'Истинность мысли по содержанию:',
  test_id: tests[0].id
)

Answer.create!([
                 { body: 'актуальность информации, содержащейся в ней',
                   question_id: question.id },

                 { body: 'соответствие её действительности',
                   question_id: question.id,
                   correct: true },

                 { body: 'интерпретация действительности',
                   question_id: question.id },

                 { body: 'максимальная приближенность её к действительности',
                   question_id: question.id }
               ])

question = Question.create!(
  body: 'Основная ошибка, возникающая при нарушении закона тождества — …',
  test_id: tests[0].id
)

Answer.create!([
                 { body: 'Подмена понятия',
                   question_id: question.id,
                   correct: true },

                 { body: 'Паралогизм',
                   question_id: question.id },

                 { body: 'Тавтология',
                   question_id: question.id }
               ])

question = Question.create!(
  body: 'Согласно закону тождества всякая мысль в процессе рассуждения …',
  test_id: tests[0].id
)

Answer.create!([
                 { body: 'должна быть тождественна самой себе',
                   question_id: question.id,
                   correct: true },

                 { body: 'должна продолжать предыдущую',
                   question_id: question.id },

                 { body: 'должна быть обоснована',
                   question_id: question.id },

                 { body: 'не должна противоречить предыдущей',
                   question_id: question.id }
               ])

Record.create!([
                 { user_id: 1, test_id: 1 },
                 { user_id: 2, test_id: 2 },
                 { user_id: 1, test_id: 2 },
                 { user_id: 1, test_id: 3 }
               ])
