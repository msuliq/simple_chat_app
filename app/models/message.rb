class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true, length: { maximum: 1000 }

  after_create_commit -> { broadcast_append_to "chat_messages_#{self.chat.id}", partial: "chats/message", locals: { message: self }, target: "messages-list" }
end
