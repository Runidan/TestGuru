# frozen_string_literal: true

class TestsController < ApplicationController
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
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test

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

  def start
    set_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def get_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
