class TwitterController < ApplicationController
  def edit
    session[:store] = params[:store]
    redirect_to twitter_login_path
  end

  def update
    @store = Store.find(session[:store])
    @store.update(twitter_token: request.env['omniauth.auth'][:credentials][:token],
                  twitter_secret: request.env['omniauth.auth'][:credentials][:secret])
    session[:store] = nil
    redirect_to "/#{@store.slug}/manage"
  end

  def create
    @store = Store.find(params[:store])
    response = @store.tweet(params[:tweet])
    flash.notice = "Your Tweet was Posted <a href=#{response.uri}>See it Here</a>"
    redirect_to "/#{@store.slug}"
  end

  def destroy
    @store = Store.find(params[:store])
    @store.update(twitter_token: nil, twitter_secret: nil)
    redirect_to "/#{@store.slug}/manage"
  end
end
