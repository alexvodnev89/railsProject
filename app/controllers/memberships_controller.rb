class MembershipsController < ApplicationController
    def create
        @membership = current_user.membership(membership_params)
        @membership.memtype = membership_params[:memtype]
        if @membership.save
    
            
            puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            puts(@membership.memtype)
            
            redirect_to memberpage_path
        else
            render 'static_pages/home'
        end
    end
    
  
  private
  
    def membership_params
      params.require(:membership).permit(:memtype)
    end
end
