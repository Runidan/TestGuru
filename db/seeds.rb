# frozen_string_literal: true

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { login: 'Cozy', password_digest: 'xVA7f%', email: 'sdf@sdf.ru' },
                       { login: 'Sprout', password_digest: '9iqX^J', email: 'dgjr@sdf.ru' },
                       { login: 'Unwrapped', password_digest: 'i$^Yk2', email: 'sfhhfsg@sdf.ru' },
                       { login: 'Crying', password_digest: 'jmU3W$', email: 'ssd@sdf.ru' },
                       { login: 'Filter', password_digest: 'Ws^MH4', email: 'kyuf@sdf.ru' }
                     ])

category = Category.create!([
                              { title: 'Логика' }, { title: 'Информатика' }, { title: 'Новая категория' }
                            ])

tests = Test.create!([
                       { title: 'Основные законы логики',
                         level: 1,
                         category: category[0],
                         author: users[0] },
                       { title: 'Основы HTML',
                         level: 1,
                         category: category[1],
                         author: users[0] },
                       { title: 'Новый тест',
                         level: 2,
                         category: category[2],
                         author: users[0] }
                     ])

question = Question.create!(
  body: 'Истинность мысли по содержанию:',
  test: tests[0]
)   

Answer.create!([
                 { body: 'актуальность информации, содержащейся в ней',
                   question: },

                 { body: 'соответствие её действительности',
                   question:,
                   correct: true },

                 { body: 'интерпретация действительности',
                   question: },

                 { body: 'максимальная приближенность её к действительности',
                   question: }
               ])

question = Question.create!(
  body: 'Основная ошибка, возникающая при нарушении закона тождества — …',
  test: tests[0]
)

Answer.create!([
                 { body: 'Подмена понятия',
                   question:,
                   correct: true },

                 { body: 'Паралогизм',
                   question: },

                 { body: 'Тавтология',
                   question: }
               ])

question = Question.create!(
  body: 'Согласно закону тождества всякая мысль в процессе рассуждения …',
  test: tests[0]
)

Answer.create!([
                 { body: 'должна быть тождественна самой себе',
                   question:,
                   correct: true },

                 { body: 'должна продолжать предыдущую',
                   question: },

                 { body: 'должна быть обоснована',
                   question: },

                 { body: 'не должна противоречить предыдущей',
                   question: }
               ])
users[0].tests.push(tests[0])
users[1].tests.push(tests[1])
users[0].tests.push(tests[1])
