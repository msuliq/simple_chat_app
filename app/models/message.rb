class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true, length: { maximum: 1000 }

  after_create :notify_chat

  private

  def notify_chat
    ActionCable.server.broadcast("notifications_channel", {
        title: self.chat.name,
        body: self.content
    })
  end
end
