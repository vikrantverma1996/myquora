class DownvoteasController < ApplicationController
	def downvoteToggleAnswer
		ans = params[:answer]
		@answer = Answer.find(ans);
		@upvotea = Upvotea.where(answer_id:ans,user_id:current_user.id).first
		upvotea = @upvotea
		@downvotea = Downvotea.where(answer_id:ans,user_id:current_user.id).first
		downvotea = @downvotea
		if downvotea
			downvotea.destroy
		else
			if upvotea
				upvotea.destroy
			end
			downvotea = Downvotea.new
			downvotea.answer_id = ans
			downvotea.user_id = current_user.id
			downvotea.save
		end

		respond_to do |format|
			format.js {}
			format.html{return redirect_to '/'}
		end
	end
end
