class DownvoteqsController < ApplicationController
	def downvoteToggle
		ques = params[:question]
		@question = Question.find(ques);
		@upvoteq = Upvoteq.where(question_id:ques,user_id:current_user.id).first
		upvoteq = @upvoteq
		@downvoteq = Downvoteq.where(question_id:ques,user_id:current_user.id).first
		downvoteq = @downvoteq
		if downvoteq
			downvoteq.destroy
		else
			if upvoteq
				upvoteq.destroy
			end
			downvoteq = Downvoteq.new
			downvoteq.question_id = ques
			downvoteq.user_id = current_user.id
			downvoteq.save
		end

		respond_to do |format|
			format.js {}
			format.html{return redirect_to '/'}
		end
	end
end
