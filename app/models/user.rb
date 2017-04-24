class User < ActiveRecord::Base
    VALID_NAME = /\A[a-zA-Z]+\z/
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 20}, format: { with: VALID_NAME }
    validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :microposts, dependent: :destroy
    has_one :membership, dependent: :destroy
    validates :password, presence: true, length: { minimum: 6 }
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    def feed
        Micropost.where("user_id = ?", id)
    end
    
    
end