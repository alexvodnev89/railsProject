class User < ActiveRecord::Base
    attr_accessor :remember_token, :activation_token
    before_create :create_activation_digest
    
    VALID_NAME = /\A[a-zA-Z]+\z/
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 20}, format: { with: VALID_NAME }
    validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :microposts, dependent: :destroy
    has_one :membership, dependent: :destroy
    has_and_belongs_to_many :gymclasses
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
    
    def downcase_email
      self.email = email.downcase
    end
    
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
    def activate
        update_attribute(:activated,    true)
        update_attribute(:activated_at, Time.zone.now)
    end
    
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end
  
end