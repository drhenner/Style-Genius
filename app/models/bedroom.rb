class Bedroom < Showroom
  has_many :showroom_products, :conditions => {:showroom_products => { :active => true }}
  has_many :products,
            :through => :showroom_products,
            :conditions => [' products.active = ? AND
                              products.product_type_id IN #{ProductType.bedroom_types.map(&:id)}', true]
end