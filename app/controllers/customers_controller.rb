class CustomersController < ApplicationController
  before_action :authenticate_user!
#------基礎課題08-2-1)beforactionの宣言を追加----- 
  before_action :set_customer, only: [:update, :show, :destroy]
#----------------------------------------------------

  def index
    @q = Customer.search(params[:q])
    @customers = @q.result(distinct: true).page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
     redirect_to @customer
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new # これをform_forで使う
    @comments = Comment.where(customer_id: params[:id].to_i)

  end

  def destroy
    @customer.destroy
    redirect_to root_path
  end
#------基礎課題08-1-1)下記を追加し、update,show,destroyから同じものを削除--------------------------
  def set_customer
    @customer = Customer.find(params[:id])
  end
#----------------------------------------------------------------  
  private
  def customer_params
    params.require(:customer).permit(:family_name,:given_name,:email,:company_id,:post_id)
  end
end
