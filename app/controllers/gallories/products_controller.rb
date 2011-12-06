class Gallories::ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])

    roomtype = @product.showroom_type  # returns bedroom or livingroom root
    showroom = current_user.send(roomtype.name.downcase.to_sym)
    @has_product = showroom ? showroom.has_product?(@product.id) : false

    respond_to do |format|
      format.json { render :json => {
                                :product => @product.as_json( :only => [ :id,
                                                                    :name,
                                                                    :description,
                                                                    :external_link ],
                                                              :methods => :featured_product_image),
                                :has_product =>  @has_product }
                  }
    end
  end
  def create
    @product = Product.find(params[:product_id])
    roomtype = @product.showroom_type  # returns bedroom or livingroom root
    showroom = current_user.send(roomtype.name.downcase.to_sym)

    if showroom && !ShowroomProduct.where(:product_id => params[:product_id], :showroom_id => showroom.id, :active => true ).first
      @showroom_product = showroom.showroom_products.new(:product_id => @product.id)
      @showroom_product.save
      respond_to do |format|
        format.json { render :json => @showroom_product.to_json( :only    => [ :id,
                                                                      :product_id]) }


      end
    else
      respond_to do |format|
        format.json { render :json => :ok, :status => 400 }
      end
    end

  end

  def destroy
    @product = Product.find(params[:product_id])

    roomtype = @product.showroom_type  # returns bedroom or livingroom root
    showroom = current_user.send(roomtype.name.downcase.to_sym)

    showroom_product = ShowroomProduct.where(:product_id => params[:product_id], :showroom_id => showroom.id, :active => true).first
    showroom_product.inactivate if showroom_product
    render :json => :ok
  end

  private

  def form_info

  end
end
