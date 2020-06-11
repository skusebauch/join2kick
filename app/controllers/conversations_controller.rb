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
      @messages = @conversation.messages # load all messages of selected conversation
      policy_scope(@messages)
    end
    authorize(@conversation)
    @message_new = Message.new # for simple_form_for
    @wish_lists = WishList.where(user_id: current_user)
    @player_is_fav = player_is_fav?(@wish_lists, @user_conversation_with)
  end

  private

  def player_is_fav?(wish_lists, player)
    real_player = Player.find_by(user_id: player.id)
    if wish_lists.where(player_id: real_player).any? && wish_lists.where(player_id: real_player)
      return true
    end
  end

  def set_conversations
    @conversations = Conversation.where(sender_id: current_user).or(Conversation.where(receiver_id: current_user))
    @conversations = policy_scope(@conversations)
  end
end
