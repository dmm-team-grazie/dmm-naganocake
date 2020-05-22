module OrdersHelper
  def taxed_price(non_taxed_price)
    tax = 1.1
    (non_taxed_price * tax).round(2).ceil
  end
end
