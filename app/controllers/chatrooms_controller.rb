class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom.all)
    @messages = policy_scope(Message.all)
    # Message.where(" user_id = ? ", current_user.id).distinct(:chatroom_id)
    # @my_chatrooms = Message.where(user_id: current_user.id)
    # raise
    # authorize(@chatrooms)
    # raise
    @chatroom_already_displayed = false
  end

  def show
    @chatrooms = policy_scope(Chatroom.all)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize(@chatroom)
    # authorize(@message)
  end
end
