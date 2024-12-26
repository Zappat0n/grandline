class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Messages::Create.new(
      user: current_user,
      message_params: message_params,
      broadcast_to: current_user
    ).call

    QueryAiJob.perform_later(@message) if @message.receiver.ai?

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
      channel: Message.channel_name(current_user.id, user.id),
      messages: current_user.conversation_with(user),
      receiver: user
    }
  end

  private

  def message_params
    params.permit(:content, :receiver_id)
  end
end
