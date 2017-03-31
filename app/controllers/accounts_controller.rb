class AccountsController < ApplicationController
	before_action :find_account, only: [:show, :edit, :update, :destroy]

	def index
        @accounts= Account.all
	end

	def new
		@account = Account.new
	end

	def show
	end

	def transfer
		puts "******************"
		if params[:account]
			@sender = Account.find params[:id]
			@reciever = Account.find params[:account]
			@ramount = @reciever.account_balance + params[:amount].to_f
			@reciever.update(:account_balance => @ramount)
			@samount = @sender.account_balance - params[:amount].to_f
			
			@sender.update(:account_balance => @samount)
		end
			
	end

	def create
		@account = Account.new(account_params)
		if @account.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		if @account.update_attributes(account_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def edit
	end

	def destroy
		@account.destroy
		redirect_to root_path
	end

	private

	def account_params
			params.require(:account).permit(:firstname, :lastname, :dob, :account_balance, :address)
	end

	def find_account
		@account = Account.find(params[:id])
	end

end
