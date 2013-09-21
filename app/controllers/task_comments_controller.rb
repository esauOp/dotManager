class TaskCommentsController < ApplicationController
	

	def create
		@task = Task.find(params[:task_id])
	  	
	    @comment = @task.comments.create(comment_params)

	  	if @comment.save
	  		redirect_to root_path, flash: { notice: 'Your comment was posted'}
	  	else
	  		redirect_to root_path, flash: { error: 'Failes to post your comment, ja!'}
	  	end  			
	end

	def destroy
		@task = Task.find(params[:task_id])
	    @comment = @task.comments.find(params[:id])
	    @comment.destroy
	    
	    redirect_to root_path		
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :reply, :task_id, :usuario_id)			
		end

end
