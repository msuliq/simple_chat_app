class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true, length: { maximum: 1000 }

  after_create_commit :broadcast_create

  def broadcast_create
    ActionCable.server.broadcast(
      "chat_messages_#{self.chat.id}",
      { partial: "messages/content", locals: { message: self } }
    )
  end
end
