class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Conversation.find(params[:conversation_id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
