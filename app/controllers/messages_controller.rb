class MessagesController < ApplicationController
  def index
    # User.order('name DESC')

    # @word=""
    @messages=Message.order("created_at DESC").page params[:page]

  end

  def new
    @button_text="save"
    @message=Message.new

  end

  def create


    params_message= params.require(:message).permit(:name, :email, :department, :message, :status)
    # Message.new
    Message.create(params_message)
    redirect_to messages_path


  end

  def show
  end

  def edit
    @message = Message.find params[:id]
    @button_text="submit"
    render :new

  end

  def update


    params_message= params.require(:message).permit(:name, :email, :department, :message, :status)
    message = Message.find params[:id]
    message.update(params_message)
    redirect_to messages_path


  end

  def destroy
    message = Message.find params[:id]
    message.destroy
    redirect_to messages_path
  end

  def done
    message = Message.find params[:id]
    # Person.update(15, :user_name => 'Samuel', :group => 'expert')

    if message.status==false
      Message.update(params[:id], :status => true)
    else
      Message.update(params[:id], :status => false)
    end

    redirect_to messages_path


  end

  def search
    @word=params[:title]

    @messages||=Message.where("message ILIKE ? or name ILIKE ? or email ILIKE ? or department ILIKE ?", "%#{@word}%", "%#{@word}%", "%#{@word}%", "%#{@word}%")
    @messages=@messages.page params[:page]
    render :index


  end

end
