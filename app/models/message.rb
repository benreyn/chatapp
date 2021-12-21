class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :author, class_name: "User", foreign_key: :author_id
  after_create_commit { broadcast_append_to self.conversation }
end
