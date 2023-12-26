class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :name, presence: true, length: { maximum: 120 }

end
