# frozen_string_literal: true

module Admin
  class TestsController < Admin::BaseController
    before_action :get_test, only: %i[show edit update destroy start]

    def index
      @tests = Test.all
    end

    def show
      @questions = @test.questions
    end

    def new
      @test = Test.new
    end

    def edit; end

    def create
      @test = current_user.tests.build(test_params)

      if @test.save
        redirect_to admin_test_path(@test)

      else
        render :new
      end
    end

    def update
      if @test.update(test_params)
        redirect_to tests_path

      else
        render :edit
      end
    end

    def destroy
      @test.destroy
      redirect_to tests_path
    end

    private

    def test_params
      params.require(:test).permit(:title, :level, :category_id)
    end

    def get_test
      @test = Test.find(params[:id])
    end
  end
end