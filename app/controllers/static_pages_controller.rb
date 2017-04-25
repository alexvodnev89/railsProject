class StaticPagesController < ApplicationController
  before_action :check
  
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @membership = current_user.membership
      
      @feed_items = current_user.feed
    end
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def check
    @user = current_user
    @membership_options = MembershipOption.all
    @mesaages = Message.all
  end
  

end
