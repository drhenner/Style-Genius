class Gallories::LivingroomsController < Gallories::BaseController
  helper_method :room
  def index
      @products = Product.livingroom_stuff.all
      @product  = Product.featured_livingroom #||
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    if livingroom.add_livingrooms(params[:bedroom_ids])
      flash[:notice] = "Successfully added to bedroom."
      redirect_to gallories_livingrooms_url()
    else
      flash[:alert] = "Could not add to bedroom."
      redirect_to gallories_livingrooms_url()
    end
  end

  def destroy
    livingroom.showroom_products.map(&:inactivate)
    flash[:notice] = "Successfully removed item."
    redirect_to gallories_livingrooms_url
  end

  private
  def room
    livingroom
  end

  def livingroom
    current_user.livingroom ||= create_livingroom
  end

  def create_livingroom
    Livingroom.create(:user_id => current_user.id)
  end

  def form_info

  end
end
