# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    @current_question = @test_passage.current_question
    @result = GistQuestionService.new(@current_question).call

    flash_options = if @result.success?
                      Gist.create!(gist_params)
                      { notice: t('.success') + " #{view_context.link_to(@result.name, @result.url)}." }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_params
    { question: @current_question, user: @test_passage.user, name: @result.name, url: @result.url }
  end
end
