class Admin::Shopping::UsersController < Admin::Shopping::BaseController
  # GET /admin/order/users
  # GET /admin/order/users.xml
  def index

    @users = User.admin_grid(params)
    respond_to do |format|
      format.html
    end
  end

  # POST /admin/order/users
  # POST /admin/order/users.xml
  def create
    @customer = User.find_by_id(params[:user_id])
    session_admin_cart.customer = @customer
    if session_admin_cart.save
      redirect_to(admin_shopping_carts_url, :notice => "#{@customer.name} was added.")
    else
      redirect_to admin_shopping_users_url
    end
  end

end
