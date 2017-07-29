class HomeController < ApplicationController
  def index
     
  	respond_to do |format|
  		format.html{
  			@question=Question.new
  			@question_feed=Question.all.order(created_at: :desc)
  			@answer=Answer.new
  			@answer_feed=Answer.all.order(created_at: :desc)
  		}
  		format.js{   }	
  	end
  end
  def profile
    @user = User.find params[:user]

  end
  def profile_picture
    uploaded_file = params[:image]
    if uploaded_file==nil
      return redirect_to '/profile'
    end
    filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
    filepath = Dir.pwd + "/public/uploads/" + filename
    File.open(filepath,'wb') do |file|
    file.write(uploaded_file.read())
    end
    current_user.profile_picture = filename
    current_user.save
    return redirect_to '/profile'
  end

def follow
  followee_id = params[:followee_id]
  @followee = User.find(followee_id)
  follower_id = current_user.id
  @follower = User.find(follower_id)
  
  f = FollowMapping.where(follower_id: follower_id,followee_id: followee_id).first
  if f
    f.destroy
  elsif followee_id.to_i != follower_id.to_i
    f = FollowMapping.new
    f.follower_id = follower_id
    f.followee_id = followee_id
    f.save
  end
 respond_to do |format|
    format.html{
       return redirect_to '/users'
    }
    format.js{ }
  end
end

end
