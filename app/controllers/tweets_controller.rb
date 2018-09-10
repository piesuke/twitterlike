class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.all.order("id DESC")
  end
  def new
    @tweet = Tweet.new
  end
  def create
 @tweet = Tweet.new(tweet_params)
 @tweet.user_id = current_user.id
 if @tweet.save
   redirect_to action:"index"
  else
    redirect_to action:"new"
  end
 end

 def mypage
   @tweets = current_user.tweets.order("id DESC")

 end

 private
 def tweet_params
   params.require(:tweet).permit(:body)
 end
  end
