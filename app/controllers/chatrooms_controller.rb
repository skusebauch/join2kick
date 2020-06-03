class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom.all)
    # authorize(@chatrooms)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize(@chatroom)
    # authorize(@message)
  end
end
