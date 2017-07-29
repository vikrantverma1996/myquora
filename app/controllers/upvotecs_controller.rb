class UpvotecsController < ApplicationController
	def upvoteToggleComment
		com = params[:comment]
		@comment = Comment.find(com);
		@upvotec = Upvotec.where(comment_id:com,user_id:current_user.id).first
		upvotec = @upvotec
		@downvotec = Downvotec.where(comment_id:com,user_id:current_user.id).first
		downvotec = @downvotec
		if upvotec
			upvotec.destroy
		else
			if downvotec
				downvotec.destroy
			end
			upvotec = Upvotec.new
			upvotec.comment_id = com
			upvotec.user_id = current_user.id
			upvotec.save
		end

		respond_to do |format|
			format.js {}
			format.html{return redirect_to '/'}
		end
	end
end
