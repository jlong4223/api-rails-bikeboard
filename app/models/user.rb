class User < ApplicationRecord
    has_secure_password
    has_many :details
    
    validates :name, presence: true
    validates :email, presence: true, :uniqueness => {:case_sensitive => false}
    # `:if => :password` - skips checking if the password is not being set; 
    # allows easier patch/put of user information w/out needing password for req
    validates :password, presence: true, length: { minimum: 4 }, :if => :password
end