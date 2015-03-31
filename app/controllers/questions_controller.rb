class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new(params[:question])
  end

  def create
    @question = Question.new(question_params)
    @question.save
      flash[:notice] = "Question successfully added."
          respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
      # redirect_to question_path(@question)
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
      flash[:notice] = "Your question has been updated!"
      redirect_to question_path(@question)
      #     respond_to do |format|
      # format.html { redirect_to questions_path(@question) }
      # format.js

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
          respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
    flash[:notice] = "Your question has been deleted forever"
  end

private
  def question_params
    params.require(:question).permit(:title, :query)
  end
end
