class User < ActiveRecord::Base
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
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

    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
      update_attribute(:remember_digest, nil)
    end

    has_and_belongs_to_many :groups

    has_many :admins,foreign_key: :admin_user_id
    has_many :admin_groups ,through: :admins , source: :admin_group

    has_many :invites,foreign_key: :invite_user_id
    has_many :invite_groups ,through: :invites , source: :invite_group
    has_many :create_users ,through: :invites , source: :create_user

    has_many :q_pages,foreign_key: :writer_id
    has_many :p_pages,foreign_key: :writer_id

    has_many :messages,foreign_key: :writer_id
  end
