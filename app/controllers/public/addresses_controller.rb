class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.page(params[:page]).reverse_order.per(3)
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
  	if @address.save
  		redirect_to public_addresses_path, notice: "successfully created address!"#保存された場合の移動先を指定。
  	else
  		@addresses = Address.Item.page(params[:page]).reverse_order.per(3)
  		render :index
  	end
  end

  def update
    @address = Address.find(params[:id])
  	if @address.update(address_params)
  		redirect_to public_addresses_path, notice: "successfully updated address!"
  	else
  		render :edit
  	end
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
  	redirect_to public_addresses_path, notice: "successfully delete address!"
  end

  private

  def  address_params
    params.require(:address).permit(:postal_code,:address,:address_name)
  end

end
