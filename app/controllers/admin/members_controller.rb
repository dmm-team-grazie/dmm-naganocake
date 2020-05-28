class Admin::MembersController < ApplicationController
	def index
		@members = Member.page(params[:page]).reverse_order.per(10)
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		@member.update(member_params)
		redirect_to admin_member_path(@member), notice: "会員情報の編集に成功しました。"
	end

	private
	def member_params
		params.require(:member).permit(:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:postal_code,:address,:phone_number,:is_valid)
	end
end
