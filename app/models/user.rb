class User < ApplicationRecord
    has_secure_password
    has_many :posts
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true

    # enum role: %i[user admin]

    # add this migration??? 
    # class AddRoleToUser < ActiveRecord::Migration[7.0]
#   def change
    # add_column :users, :role, :integer, default: 0
#   end
    # end
end
