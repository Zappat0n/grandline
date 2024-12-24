class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]

  has_many :messages
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id
  has_many :contacts, foreign_key: :user_id
  has_many :contact_users, through: :contacts, source: :contact

  scope :ai, -> { where(ai: true) }

  def conversation_with(user)
    Message.where(user: self, receiver: user).or(Message.where(user: user, receiver: self)).order(created_at: :asc)
  end

  def ai_models
    contact_users.where(ai: true)
  end

  private

  def email_required?
    false
  end
end
