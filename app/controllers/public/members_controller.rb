class Public::MembersController < ApplicationController
	def show		
	end

	def edit
		@member = current_member
	end

	def leave
		@member = current_member
	end

	def update
		@member = current_member
		@member.update(member_params)
		redirect_to public_path
	end

	def update_status
		@member = current_member
		@member.update(member_params)
		redirect_to root_path
	end

	private
	def member_params
		params.require(:member).permit(:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:postal_code,:address,:phone_number,:is_valid)
	end


end
