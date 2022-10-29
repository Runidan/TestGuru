# frozen_string_literal: true

module Admin
  class QuestionsController < Admin::BaseController
    before_action :get_test, only: %i[new create]
    before_action :get_question, only: %i[show edit destroy update]

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

    def show; end

    def new
      @question = @test.questions.new
    end

    def edit; end

    def create
      @question = @test.questions.new(question_params)
      if @question.save
        redirect_to admin_question_path(@question)
      else
        render :new
      end
    end

    def update
      if @question.update(question_params)
        redirect_to admin_test_path(@question.test)
      else
        render :edit
      end
    end

    def destroy
      @question.destroy
      redirect_to admin_test_path(@question.test_id)
    end

    private

    def get_test
      @test = Test.find(params[:test_id])
    end

    def get_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:body)
    end

    def rescue_with_question_not_found
      render plain: 'Question was not found'
    end
  end
end
