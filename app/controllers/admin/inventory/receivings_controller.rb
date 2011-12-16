class Admin::Inventory::ReceivingsController < Admin::BaseController
  def index
    # by default find all POs that are not received

    @purchase_orders = PurchaseOrder.receiving_admin_grid(params)
    respond_to do |format|
      format.html
    end
  end

  #def new
  #end

  #def create
  #end

  def edit
    @purchase_order = PurchaseOrder.includes([:variants ,
                                              :supplier,
                                              {:purchase_order_variants => {:variant => :product }}]).find(params[:id])
    form_info
  end

  def update
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      if @purchase_order.update_attributes(params[:purchase_order])
        format.html { redirect_to(:action => :index, :notice => 'Purchase order was successfully updated.') }
      else
        form_info
        format.html { render :action => "edit" }
      end
    end
  end

  def show
  end

private
  def form_info

  end
end
