# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :get_test, only: [:index, :show]
  before_action :get_question, only: [:show]

  def index
    render inline: '<ul><% @test.questions.each do |question| %><li><%= question.body %></li><% end %></ul>'
  end

  def show
    render inline: '<p><%= @question.body %></p>'
  end

  def new
    
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end

  def get_question
    @question = Question.find(params[:id])
  end
end
