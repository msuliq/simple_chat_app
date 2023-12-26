class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    chat_id = params[:chat_id]
    stream_from "chat_messages_#{chat_id}"
    logger.info("Subscribed to chat_messages_#{chat_id}")
  end

  def unsubscribed
  end
end
