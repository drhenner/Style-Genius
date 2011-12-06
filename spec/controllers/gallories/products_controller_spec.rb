require  'spec_helper'

describe Gallories::ProductsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = Factory(:user)
    login_as(@user)
    @bed_room = Bedroom.create(:user_id => @user.id)
    @living_room = Livingroom.create(:user_id => @user.id)
  end

  it "show action should render show template" do
    create_product_type_structure

    @product = Factory(:product, :product_type => ProductType.last)
    get :show, :id => @product.id, :format => :json
    response.body.include?('product').should be_true

    #format.json { render :json => {
    #                          :product => @product.as_json( :only => [ :id,
    #                                                              :name,
    #                                                              :description,
    #                                                              :external_link ],
    #                                                        :methods => :featured_product_image),
    #                          :has_product =>  @has_product }
    #            }
  end
end
