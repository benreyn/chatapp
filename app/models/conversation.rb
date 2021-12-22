class Conversation < ApplicationRecord
  has_many :conversation_users
  has_many :users, through: :conversation_users
  has_many :messages

  # NOTE: I really don't like alot about this method. It
  # is not named well, would not support conversations between
  # more than 2 users and ultimately will not be performant on
  # pages with many conversations. This is hacky and would need
  # to be revisited before an application like this that expects
  # any reasonable scale could be shipped to production
  def other_user(user)
    users.where.not(id: user).first
  end
end
