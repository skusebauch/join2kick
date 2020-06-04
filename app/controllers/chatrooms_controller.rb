class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom.all)
    # @my_chatrooms = Message.where(user_id: current_user.id)
    # raise
    # authorize(@chatrooms)
  end

  def show
    @chatrooms = policy_scope(Chatroom.all)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize(@chatroom)
    # authorize(@message)
  end
end
