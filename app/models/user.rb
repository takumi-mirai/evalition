class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 30 }
            
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
            
  has_secure_password
  validates :password,
            presence: true,
            length: { minimum: 8},
            format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[\W_])[!-~]+\z/ }
  
  has_many :topics
  has_many :posts
end