class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation_id = params[:conversation_id]
    authorize(@message)
    if @message.save
      #ChatroomChannel.broadcast_to(
      #  @chatroom,
      #  render_to_string(partial: "message", locals: { message: @message })
      #)
      # scroll down to current message
      # redirect_to conversations_path(params[:conversation_id], anchor: "message-#{@message_new.id}")
      #redirect_to conversation_path(params[:conversation_id])
      if current_user == @message.conversation.sender
        redirect_to conversation_path(@message.conversation.receiver)
      else
        redirect_to conversation_path(@message.conversation.sender)
      end
    else
      render "conversations/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
