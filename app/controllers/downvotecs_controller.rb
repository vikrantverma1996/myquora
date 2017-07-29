class DownvotecsController < ApplicationController
def downvoteToggleComment
		com = params[:comment]
		@comment = Comment.find(com);
		@upvotec = Upvotec.where(comment_id:com,user_id:current_user.id).first
		upvotec = @upvotec
		@downvotec = Downvotec.where(comment_id:com,user_id:current_user.id).first
		downvotec = @downvotec
		if downvotec
			downvotec.destroy
		else
			if upvotec
				upvotec.destroy
			end
			downvotec = Downvotec.new
			downvotec.comment_id = com
			downvotec.user_id = current_user.id
			downvotec.save
		end

		respond_to do |format|
			format.js {}
			format.html{return redirect_to '/'}
		end
	end
end
