class Admin::OrderDetailsController < ApplicationController
before_action :authenticate_admin!

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)

    if all_order_details_completed?(order_detail.order)
      update_order_status(order_detail.order, 'preparing_shipment')
    end

    redirect_to admin_order_path(order_detail.order_id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

  def update_order_status(order, status)
    order.update(status: status)
  end

  def all_order_details_completed?(order)
    order.order_details.all? { |detail| detail.making_status == 'completed' }
  end
end
