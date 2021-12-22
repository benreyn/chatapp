class ConversationsController < ApplicationController
  def create
    conversation = Conversation.new
    conversation.conversation_users.build(user: current_user)
    conversation.conversation_users.build(user_id: params[:user_id])
    conversation.save!
    redirect_to conversation_path(conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(created_at: :asc)
  end

  def index
    @conversations = current_user.conversations
  end
end
