class MessagesController < ApplicationController

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages

    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @message.last
      if @message.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

  end



  def create
    @message = @conversation.messages.build(messages_params)

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def messages_params
      params.require(:message).permit(:body, :user_id)
    end

end
