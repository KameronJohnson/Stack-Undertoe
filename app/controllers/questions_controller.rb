class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully added."
      redirect_to question_path(@question)
    else
      render :new
    end
  end

private
  def question_params
    params.require.(:question).permit(:title, :query)
  end
end
