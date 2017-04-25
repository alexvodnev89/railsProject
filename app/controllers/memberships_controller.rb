class MembershipsController < ApplicationController
    def create
        
        @membership = current_user.membership(membership_params)
        
        puts(params)
        
        @membership.memtype = membership_params[:memtype]
        if @membership.save
            redirect_to memberpage_path
        else
            render 'static_pages/home'
        end
    end
    
  
  private
  
    def membership_params
      params.permit(:memtype)
    end
end
