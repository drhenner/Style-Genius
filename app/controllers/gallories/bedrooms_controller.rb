class Gallories::BedroomsController < Gallories::BaseController
  helper_method :room
  def index
    @products = Product.bedroom_stuff.all
    @product  = Product.featured_bedroom #||

  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    if bedroom.add_bedrooms(params[:bedroom_ids])
      flash[:notice] = "Successfully added to bedroom."
      redirect_to gallories_bedrooms_url()
    else
      flash[:alert] = "Could not add to bedroom."
      redirect_to gallories_bedrooms_url()
    end
  end

  def destroy
    bedroom.showroom_products.map(&:inactivate)
    flash[:notice] = "Successfully removed item."
    redirect_to gallories_bedrooms_url
  end

  private
  def room
    bedroom
  end

  def bedroom
    current_user.bedroom ||= create_bedroom
  end

  def create_bedroom
    Bedroom.create(:user_id => current_user.id)
  end

  def form_info

  end
end
