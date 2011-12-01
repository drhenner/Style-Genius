require  'spec_helper'

describe MyRooms::OverviewsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = Factory(:user)
    login_as(@user)
  end

  it "show action should render show template" do
    get :show
    response.should render_template(:show)
  end
end
