require  'spec_helper'

describe MyRooms::BedroomsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = Factory(:user)
    login_as(@user)
  end

  it "show action should render show template" do
    get :show
    response.should redirect_to(gallories_bedrooms_url)
  end

  it "show action should render show template" do
    @bedroom = Factory(:bedroom, :user => @user)
    get :show
    response.should render_template(:show)
  end
end

describe MyRooms::BedroomsController do
  render_views

  it "not logged in should redirect to login page" do
    get :show
    response.should redirect_to(login_url)
  end
end
