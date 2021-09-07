class MessagesController < ApplicationController
  before_action :authorized

  def new
    @recipient = User.find(params[:user_id])
    redirect_if_same_user
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @recipient = User.find(params[:message][:recipient_user_id])
    redirect_if_same_user
    @message.recipient = @recipient

    if @message.save
      redirect_to sent_path, notice: 'Message sent'
    else
      render :new, alert: 'Message failed to send'
    end
  end

  def destroy
  end

  def received
    @messages = current_user.received_messages_newest
  end

  def sent
    @messages = current_user.sent_messages_newest
  end

  #-------------------------------
  private

  def redirect_if_same_user
    if @recipient == current_user
      redirect_to root_path, alert: 'Cannot send a message to yourself'
    end
  end

  def message_params
    params.require(:message).permit(:recipient_user_id, :body)
  end
end
