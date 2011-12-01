class MyRooms::LivingroomsController < MyRooms::BaseController
  def show
    @livingroom = Livingroom.includes(:products).
                        where("showrooms.user_id = ?", current_user.id).
                        last()
    if @livingroom.nil?
      flash[:notice] = "You don't have any items in your livingroom."
      #redirect_to gallories_livingrooms_url
    end
  end

  private

  def form_info

  end
end
