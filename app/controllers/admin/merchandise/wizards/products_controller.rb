class Admin::Merchandise::Wizards::ProductsController < Admin::Merchandise::Wizards::BaseController
  def new
    if f = next_wizard_form
      redirect_to f
    else
      form_info
      @product = Product.new
      @product.brand_id         = session[:product_wizard][:brand_id]
      @product.product_type_id  = session[:product_wizard][:product_type_id]

      #@product.tax_category_id = session[:product_wizard][:tax_category_id]
      @product.tax_status_id = session[:product_wizard][:tax_status_id]
      @product.shipping_category_id = session[:product_wizard][:shipping_category_id]
    end
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      reset_product_wizard
      flash[:notice] = "Successfully created product."
      redirect_to edit_admin_merchandise_products_description_url(@product)
    else
      form_info
      render :action => 'new'
    end
  end

  private

  def form_info
    if session[:product_wizard][:prototype_id]
      @all_properties           = Prototype.find(session[:product_wizard][:prototype_id]).properties
    else #@all_properties           = Property.all
      @all_properties           = Property.find(session[:product_wizard][:property_ids])
    end
    @select_product_types     = ProductType.all.collect{|pt| [pt.name, pt.id]}
    @select_shipping_category = ShippingCategory.all.collect {|sc| [sc.name, sc.id]}
    @select_tax_status        = TaxStatus.all.collect {|ts| [ts.name, ts.id]}
    @brands        = Brand.all.collect {|ts| [ts.name, ts.id]}
  end
end
