class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]

  has_many :messages
  has_many :contacts, foreign_key: :user_id
  has_many :contact_users, through: :contacts, source: :contact

  def conversation_with(user)
    Message.where(user: self, receiver: user).or(Message.where(user: user, receiver: self))
  end

  private

  def email_required?
    false
  end
end
