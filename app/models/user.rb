class User < ApplicationRecord
  include Clearance::User

  has_many :messages, inverse_of: :author
  has_many :conversation_users
  has_many :conversations, through: :conversation_users

  scope :no_active_conversation_with, -> (user) {
    where.not(
      id: 
        ConversationUser.where(
        conversation_id: user.conversations.select(:id)
      ).select(:user_id) + [user.id]
    )
  }
end
