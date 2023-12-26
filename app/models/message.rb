class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true, length: { maximum: 1000 }

  after_create_commit -> { broadcast_append_to "chat_messages_#{self.chat.id}", partial: "chats/message", locals: { message: self }, target: "messages-list" }

  after_create :notify_chat

  private

  def notify_chat
    ActionCable.server.broadcast("notifications_channel", {
        title: self.chat.name,
        body: self.content
    })
  end
end
