class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
    if params[:question_id].present?
      @comments = @question.comments
    elsif params[:answer_id].present?
      @comments = @answers.comments
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :description, :user_id)
    end

   
end
