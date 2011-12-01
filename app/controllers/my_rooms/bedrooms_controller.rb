class MyRooms::BedroomsController < MyRooms::BaseController
  def show
    @bedroom = Bedroom.includes(:products).
                        where("showrooms.user_id = ?", current_user.id).
                        last()
    if @bedroom.nil?
      flash[:notice] = "You don't have any items in your bedroom."
      #redirect_to gallories_bedrooms_url
    end
  end

  private

  def form_info

  end
end
