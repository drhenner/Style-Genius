require  'spec_helper'

describe Gallories::BedroomsController do
  render_views

  before(:all) do
    create_product_type_structure
  end

  before(:each) do
    activate_authlogic

    @user = Factory(:user)
    login_as(@user)
    @bed_room = Bedroom.create(:user_id => @user.id)
  end

  it "index action should render index template" do
    Factory(:product, :product_type_id => ProductType.find_by_name('Dressers').id)
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    @product = Factory(:product)
    get :show, :id => @product.id
    response.should render_template(:show)
  end

  it "update action should render edit template when model is invalid" do
    @product = Factory(:product)
    Product.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @product.id, :bedroom_ids => []
    response.should redirect_to(gallories_bedrooms_url)#render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @product = Factory(:product)
    Product.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @product.id, :bedroom_ids => []
    response.should redirect_to(gallories_bedrooms_url)
  end

  it "destroy action should destroy model and redirect to index action" do
    @product = Factory(:product)
    @bed_room.add_bedrooms([@product.id])
    delete :destroy, :id => @product.id
    response.should redirect_to(gallories_bedrooms_url)
    @bed_room.reload
    @bed_room.showroom_product_ids.include?(@product.id).should be_false
  end
end
