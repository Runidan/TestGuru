# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index show new create]
  before_action :get_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<ul><% @test.questions.each do |question| %><li><%= question.body %></li><% end %></ul>'
  end

  def show
    render inline: '<p><%= @question.body %></p>'
  end

  def new;  end

  def edit; end

  def create
    @question = Question.new question_paras
    if @question.save
      redirect_to test_questions_path
    else
      redirect_to new_test_question_path
    end
  end

  def update; end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test_id)
  end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end

  def get_question
    @question = Question.find(params[:id])
  end

  def question_paras
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
