class MessagesController < ApplicationController
  def create
    message = Message.new(message_params.merge(author: current_user))
    message.save!
    redirect_to message.conversation
  end

  private

  def message_params
    params.require(:message).permit(
      :conversation_id,
      :text,
    )
  end
end
