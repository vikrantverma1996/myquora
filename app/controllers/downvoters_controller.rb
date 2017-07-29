class DownvotersController < ApplicationController
def downvoteToggleReply
		rep = params[:reply]
		@reply = Reply.find(rep);
		@upvoter = Upvoter.where(reply_id:rep,user_id:current_user.id).first
		upvoter = @upvoter
		@downvoter = Downvoter.where(reply_id:rep,user_id:current_user.id).first
		downvoter = @downvoter
		if downvoter
			downvoter.destroy
		else
			if upvoter
				upvoter.destroy
			end
			downvoter = Downvoter.new
			downvoter.reply_id = rep
			downvoter.user_id = current_user.id
			downvoter.save
		end

		respond_to do |format|
			format.js {}
			format.html{return redirect_to '/'}
		end
	end
end
