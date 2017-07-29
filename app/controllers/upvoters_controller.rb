class UpvotersController < ApplicationController
def upvoteToggleReply
		rep = params[:reply]
		@reply = Reply.find(rep);
		@upvoter = Upvoter.where(reply_id:rep,user_id:current_user.id).first
		upvoter = @upvoter
		@downvoter = Downvoter.where(reply_id:rep,user_id:current_user.id).first
		downvoter = @downvoter
		if upvoter
			upvoter.destroy
		else
			if downvoter
				downvoter.destroy
			end
			upvoter = Upvoter.new
			upvoter.reply_id = rep
			upvoter.user_id = current_user.id
			upvoter.save
		end

		respond_to do |format|
			format.js {}
			format.html{return redirect_to '/'}
		end
	end
end
