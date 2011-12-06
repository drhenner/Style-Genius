class ProductType < ActiveRecord::Base
  acts_as_nested_set  #:order => "name"
  has_many :products

  validates :name,    :presence => true, :length => { :maximum => 255 }

  FEATURED_TYPE_ID = 1

  ROOM_TYPES = {
            'Bedroom'     => ['Dressers', 'Beds', 'mattresses'],
            'Livingroom'  => ['Couches', 'Chairs', 'TV Stands', 'End Tables', 'Coffee Tables']
                }

  def self.livingroom_types
    ProductType.room_types('Livingroom')
  end

  def self.bedroom_types
    ProductType.room_types('Bedroom')
  end
  # paginated results from the admin ProductType grid
  #
  # @param [Optional params]
  # @return [ Array[ProductType] ]
  def self.admin_grid(params = {})

    params[:page] ||= 1
    params[:rows] ||= SETTINGS[:admin_grid_rows]

    grid = ProductType
    grid = grid.where("product_types.name LIKE '?'", params[:name])              if params[:name].present?
    grid = grid.where("product_types.name LIKE '?%'", params[:name_starts_with]) if params[:name_starts_with].present?
    grid = grid.where("product_types.name LIKE '%?%'", params[:name_contains])   if params[:name_contains].present?
    grid.order(:name).paginate({:page => params[:page].to_i,:per_page => params[:rows].to_i})
  end

  private

  def self.room_types(name)
    ProductType.find_by_name(name).self_and_children
  end

end
