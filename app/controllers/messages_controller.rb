class MessagesController < ApplicationController
  def create
    @message_new = Message.new(message_params)
    @message_new.user = current_user
    @message_new.conversation_id = params[:conversation_id]
    authorize(@message_new)
    if @message_new.save
      #ChatroomChannel.broadcast_to(
      #  @chatroom,
      #  render_to_string(partial: "message", locals: { message: @message })
      #)
      # scroll down to current message
      # redirect_to conversations_path(params[:conversation_id], anchor: "message-#{@message_new.id}")
      redirect_to conversation_path(params[:conversation_id])
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
