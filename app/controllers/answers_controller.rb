class AnswersController < ApplicationController
    before_action :authenticate_user!
   
    def create
      @question= Question.find(params[:question_id])
      @answer = @question.answers.new(answer_params)
      @answer.user = current_user
      if @answer.save
        redirect_to question_path(@question), notice: "Tu respuesta se guardó exitosamente"
      elsif @answer.errors.any?
        redirect_to question_path(@question), alert: "No se pudo guardar ya que tu respuesta no puede estar en blanco"
      else
        redirect_to question_path(@question), alert: "No se pudo guardar tu respuesta"
      end

end
    
    private
    
      def answer_params
        params.require(:answer).permit(:description, :user_id)
      end

      def comment_params
        params.require(:comment).permit(:text, :user_id)
      end


        
  
  
  end