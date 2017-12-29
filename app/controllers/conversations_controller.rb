class ConversationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.betweem(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversations_params)
      redirect_to conversation_messages_path(@conversation)
  end


  private
    def conversations_params
      params.permit(:sender_id, :recipient_id)
    end

end
