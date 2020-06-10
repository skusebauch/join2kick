class MessagesController < ApplicationController
  before_action :set_conversation, only: [:create]

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation_id = params[:conversation_id]
    authorize(@message)
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "message", locals: { message: @message })
      )
      # scroll down to current message
      # redirect_to conversations_path(params[:conversation_id], anchor: "message-#{@message_new.id}")
      # redirect_to conversation_path(params[:conversation_id])
      if current_user == @message.conversation.sender
        redirect_to conversation_path(@message.conversation.receiver, anchor: "message-#{@message.id}")
      else
        redirect_to conversation_path(@message.conversation.sender, anchor: "message-#{@message.id}")
      end
    else
      render "conversations/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
    @conversation = authorize(@conversation)
  end
end
