class TaskCommentsController < ApplicationController
	

	def create
		@task = Task.find(params[:task_id])
	  	
	    @comment = @task.task_comments.new(comment_params)
	    @comment.usuario_id = current_usuario.id

	  	if @comment.save
	  		redirect_to @task, flash: { notice: 'Your comment was posted'}
	  	else
	  		redirect_to @task, flash: { error: 'Failes to post your comment, ja!'}
	  	end  			
	end

	def destroy
		@task = Task.find(params[:task_id])
	    @comment = @task.comments.find(params[:id])
	    @comment.destroy
	    
	    redirect_to @task		
	end


	private
		def comment_params
			params.require(:task_comment).permit(:content, :task_id, :usuario_id)			
		end

end
