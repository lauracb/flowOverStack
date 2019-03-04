class AnswersController < ApplicationController
    before_action :authenticate_user!
   

    def create
        @question= Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)
        @answer.user = current_user
        @answer.save
        redirect_to question_path(@question)
        
    
    # @answer = @commentable.comments.new(comment_params)
    # @answer.user = current_user
    # if @commentable.save
    #     redirect_to questions_path, notice: "Your comments was successfully posted..."
    # end
end
    
    private
    
      def answer_params
        params.require(:answer).permit(:description)
      end

      def comment_params
        params.require(:comment).permit(:text, :user_id)
      end


        
  
  
  end