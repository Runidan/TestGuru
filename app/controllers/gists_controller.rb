
class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.nil?
      { alert: t('.failure') }
    else
      { notice: t('.success') }
    end
    
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
