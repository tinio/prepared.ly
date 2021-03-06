class UserMailer < ActionMailer::Base
  default from: "notifications@prepared.ly"

  def welcome_email(user)
  	@user 					= user
  	@url 						= "http://prepared.ly/users/sign_in"
  	@share_url			= "http://www.prepared.ly/?ref=" + @user.share_code
  	@facebook_share = "http://www.facebook.com/sharer.php?u=prepared.ly?ref=" + @user.share_code
  	@tumblr_share 	= "http://www.tumblr.com/share/link?url=prepared.ly?ref=" + @user.share_code
  	@twitter_share 	= "http://twitter.com/share?text=Check%20out%20Preparedly&url=prepared.ly?ref=" + @user.share_code
  	@survey 				= "http://bit.ly/preparedlysurvey"
  	attachments.inline['preparedly-red.png'] = File.read('app/assets/images/preparedly-red.png')
  	mail(:to => user.email, :subject => "Welcome to Prepared.ly")
  end
end
