class Public::AddressesController < ApplicationController

  def index
    @addresses = current_member.addresses.page(params[:page]).reverse_order.per(3)
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
  	if @address.save
  		redirect_to public_addresses_path, notice: "配送先の作成に成功しました!"#保存された場合の移動先を指定。
  	else
  		@addresses = Address.page(params[:page]).reverse_order.per(3)
  		render :index
  	end
  end

  def update
    @address = Address.find(params[:id])
  	if @address.update(address_params)
  		redirect_to public_addresses_path, notice: "配送先の更新に成功しました!"
  	else
  		render :edit
  	end
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
  	redirect_to public_addresses_path, notice: "配送先の削除に成功しました!"
  end

  private

  def  address_params
    params.require(:address).permit(:postal_code,:address,:address_name, :member_id)
  end

end
