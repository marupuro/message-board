class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]
    def index
        @messages = Message.all.order(id: :desc).page(params[:page]).per(30)
    end
    
    def show
    end
    
    def new
        @message = Message.new
    end
    
    def create 
        @message = Message.new(message_params)
        
        if @message.save
            flash[:success] = 'Messageが正常に作動しました'
            redirect_to @message
        else
            flash.now[:danger] = 'Messageが投稿されませんでした。'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @message.update(message_params)
            flash[:success] = 'Messageは正常に更新されやーした'
            redirect_to @message
        else
            flash.noe[:danger] = 'Messageは更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @message.destroy
        
        flash[:success] = 'Messageは正常に削除されやーした'
        redirect_to messages_url
        
    end
    
    private
    
    def set_message
        @message = Message.find(params[:id])
    end
    #storong parameter
    def message_params
        params.require(:message).permit(:content, :title)
    end
end

