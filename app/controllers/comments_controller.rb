class CommentsController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @customer = Customer.find(@comment.customer_id) #findは見にいくのがidと決まっている
    @comments = Comment.where(customer_id:@comment.customer_id) #whereはカラムの指定が必要
    if @comment.save
      redirect_to customer_path(@comment.customer_id)
    else
      render template:"customers/show"
    end 
  end
    
  def edit

  end

  def update

  end

  def destroy
    #------------------------------下記を追加----------------------
    @comment = Comment.find(params[:id])
    # @commentがdestroyされる前に、commentが誰のものかを変数に保存する
    customer_id = @comment.customer_id
    @comment.destroy
    # さっき保存したcustomer_idをここで使う
    redirect_to customer_path(customer_id)
    #-----------------------------------------------------------------
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:body, :customer_id)
  end
end