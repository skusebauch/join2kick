class ConversationsController < ApplicationController
  before_action :set_conversations, only: [:index, :show]

  def index
  end

  def show
    @messages = Message.where(conversation_id: params[:id]) # load all messages of selected conversation
    policy_scope(@messages)
    @message_new = Message.new # for simple_form_for
    @conversation = @conversations.find(params[:id]) # current conversation
    authorize(@conversation)
    if @conversation.sender_id == current_user.id # set correct receiver to display
      @message_receiver = User.find(@conversation.receiver_id)
    else
      @message_receiver = User.find(@conversation.sender_id)
    end
  end

  private

  def set_conversations
    @conversations = Conversation.where(sender_id: current_user).or(Conversation.where(receiver_id: current_user))
    @conversations = policy_scope(@conversations)
  end
end
