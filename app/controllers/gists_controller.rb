
class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    @current_question = @test_passage.current_question
    @result = GistQuestionService.new(@current_question).call

    flash_options = if @result.nil?
      { alert: t('.failure') }
    else
      Gist.create!(gist_params)
      { notice: t('.success', gist_url: @result.url) } 
    end
    
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_params
    { question_id: @current_question.id, user_id: @test_passage.user.id, name: @result.id, url: @result.url }
  end
end
