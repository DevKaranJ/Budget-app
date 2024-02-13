# app/controllers/transactions_controller.rb

class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def index
    @transactions = @category.transactions.order(created_at: :desc)
  end

  def new
    @transaction = @category.transactions.new
  end

  def create
    @transaction = @category.transactions.new(transaction_params)
    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end