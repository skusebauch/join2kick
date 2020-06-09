class ConversationsController < ApplicationController
  before_action :set_conversations, only: [:index, :show]

  def index
  end

  def show
    @user_conversation_with = User.find(params[:id])
    # find current conversation, if any
    @conversation = @conversations.where(sender_id: @user_conversation_with).or(@conversations.where(receiver_id: @user_conversation_with))
    if @conversation.empty?
      @messages = [Message.new(user_id: @user_conversation_with.id, content: "Start Messaging")]
      @conversation = Conversation.create(sender_id: current_user.id, receiver_id: @user_conversation_with.id)
    else
      @conversation = @conversation.first
      @messages = @conversation.messages
      # @messages = Message.where(conversation_id: params[:id]) # load all messages of selected conversation
      policy_scope(@messages)
    end
    authorize(@conversation)
    @message_new = Message.new # for simple_form_for
  end

  private

  def set_conversations
    @conversations = Conversation.where(sender_id: current_user).or(Conversation.where(receiver_id: current_user))
    @conversations = policy_scope(@conversations)
  end
end
