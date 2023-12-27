class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)

    if @message.save
      broadcast

      redirect_to chat_path(@chat), notice: 'Message sent successfully'
    else
      render 'chats/show'
    end
  end

  # API endpoint to create messages
  # curl -X POST -H "Content-Type: application/json" -d '{"message": {"content": "message from api"}, "chat_id": 1}' http://localhost:3000/api/messages

  def api_create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: { errors: 'failed' }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def broadcast
    Turbo::StreamsChannel.broadcast_append_to(
      "chat_messages_#{@chat.id}",
      target: 'messages-list',
      partial: 'chats/message',
      locals: { message: @message }
    )
  end
end
