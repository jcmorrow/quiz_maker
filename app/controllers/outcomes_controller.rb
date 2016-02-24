class OutcomesController < ApplicationController

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @outcome = Outcome.new(quiz: @quiz)
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @outcome = Outcome.create(outcome_params)
    if(@outcome.save)
      redirect_to edit_quiz_path(@outcome.quiz)
    else
      render :new
    end
  end

  def edit
    @outcome = Outcome.find(params[:id])
  end

  private

  def outcome_params
    params.require(:outcome).permit(:body, :name).merge(quiz: @quiz) 
  end

end
