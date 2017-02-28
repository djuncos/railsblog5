class User < ApplicationRecord

	validates :email, presence: true

	validates :username, presence: true

	validates :password, presence: true

	validates :email, confirmation: true

	validates :password, confirmation: true

	validates :username, uniqueness: true

	has_attached_file :avatar, styles: { meelo: "300x300>", lilguy: "75x75>" }, default_url: "missing_thumb.jpg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  	# has_secure_password

  	 # Returns the hash digest of the given string.
  	def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

  has_many :posts

end
