class MembershipOption < ActiveRecord::Base
    validates_presence_of :title, :description, :price
end
