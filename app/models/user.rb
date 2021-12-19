class User < ApplicationRecord
  include Clearance::User

  has_many :messages, inverse_of: :author
  has_many :conversation_users
  has_many :conversations, through: :conversation_users
end
