class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages.create!(message_params)
    publish_message(@message)

    respond_to do |format|
      format.turbo_stream
    end
  end

  def index
    service = Messages::Index.new(user: current_user)

    render locals: {
      messages: service.messages
    }
  end

  def show
    user = User.find(params[:id])
    render locals: {
      room_name: Message.room_name(current_user.id, user.id),
      messages: current_user.conversation_with(user),
      receiver: user
    }
  end

  private

  def publish_message(message)
    MessageBroadcastJob.perform_later(message)
  end

  def message_params
    params.permit(:content, :receiver_id)
  end
end
