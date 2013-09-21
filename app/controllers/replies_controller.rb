class RepliesController < ApplicationController

	def create
		@TaskComment = TaskComment.find(params[:task_comment_id])

	  	
	    @comment = @TaskComment.replies.new(reply_params)
	    @comment.usuario_id = current_usuario.id

	  	if @comment.save
	  		redirect_to task_path(@TaskComment.task_id), flash: { notice: 'Your comment was posted'}
	  	else
	  		redirect_to task_path(@TaskComment.task_id), flash: { error: 'Failes to post your comment, ja!'}
	  	end  			
	end

	def destroy
		@task = TaskComment.find(params[:task_comment_id])
	    @comment = @task.comments.find(params[:id])
	    @comment.destroy
	    
	    redirect_to task_path(@TaskComment.task_id)		
	end


	private
		def reply_params
			params.require(:reply).permit(:content, :task_comment_id, :usuario_id)			
		end

end
