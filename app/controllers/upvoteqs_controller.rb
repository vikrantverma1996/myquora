class UpvoteqsController < ApplicationController
	def upvoteToggle
		ques = params[:question]
		@question = Question.find(ques);
		@upvoteq = Upvoteq.where(question_id:ques,user_id:current_user.id).first
		upvoteq = @upvoteq
		@downvoteq = Downvoteq.where(question_id:ques,user_id:current_user.id).first
		downvoteq = @downvoteq
		if upvoteq
			upvoteq.destroy
		else
			
			if downvoteq
				downvoteq.destroy
			end
			upvoteq = Upvoteq.new
			upvoteq.question_id = ques
			upvoteq.user_id = current_user.id
			upvoteq.save
		end
		respond_to do |format|
			format.js {}
			format.html{return redirect_to '/'}
		end
		
	end
end