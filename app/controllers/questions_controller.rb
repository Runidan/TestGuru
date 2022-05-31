class QuestionsController < ApplicationController

  before_action :get_test

  def index
    render inline: "<ul><% @test.questions.each do |question| %><li><%= question.body %></li><% end %></ul>"

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def get_test
    @test = Test.find(params[:test_id])
  end
end
