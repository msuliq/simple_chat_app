class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      redirect_to root_path, notice: 'Chat created successfully'
    else
      render :new
    end
  end

  # API endpoint to fetch existing chats
  # test with curl -X GET http://localhost:3000/api/chats
  def api_index
    chats = Chat.all
    render json: chats, only: [:id, :name], status: :ok
  end

  private

  def chat_params
    params.require(:chat).permit(:name)
  end
end
