class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :commentable

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @commentable.save
      redirect_to request.referrer, notice: "Tu comentario se publicó exitosamente"
    elsif @commentable.errors.any?
      redirect_to request.referrer, alert: "No se pudo guardar ya que tus comentarios no pueden estar en blanco"
    else
      redirect_to request.referrer, alert: "No se pudo guardar tu comentario"
    end
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:text)
    end

    def commentable
      @commentable = Question.find_by_id(params[:question_id]) if params[:question_id].present?
      @commentable = Answer.find_by_id(params[:answer_id]) if params[:answer_id].present?
    end

end
