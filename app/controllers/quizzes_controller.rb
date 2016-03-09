class QuizzesController < ApplicationController
  before_action :require_login, except: [:show]

  def new
    authorize :quiz
    @quiz = Quiz.new
  end

  def create
    authorize :quiz
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to edit_quiz_path(@quiz)
    else
      render :new, status: 422
    end
  end

  def index
    authorize :quiz
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.friendly.find(params[:id])
  end

  def edit
    @quiz = Quiz.includes(:outcomes, questions: { choices: :weights }).friendly.find(params[:id])
    @new_question = Question.new(quiz: @quiz)
    authorize @quiz
  end
  private

  def quiz_params
    params.require(:quiz).permit(:slug, :title, :intro_content)
  end

end
