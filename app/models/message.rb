class Message < ActiveRecord::Base
    VALID_NAME = /\A[a-zA-Z]+\z/
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 20}, format: { with: VALID_NAME }
    validates :email, presence: true, format: { with: VALID_EMAIL }
    validates :messagebody, presence: true, length: { maximum: 150 }
end
