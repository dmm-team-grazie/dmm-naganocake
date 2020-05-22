class Public::MembersController < ApplicationController
	def show
		
	end

	def edit
	end

	def update
		@member = Member.find(params[:id])
		@member.update(is_valid: false)
		reset_session # ログアウトさせる
		redirect_to root_path
	end

	def leave
	end

	private
	def member_params
		params.require(:member).permit(:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:postal_code,:address,:phone_number)
	end


end
