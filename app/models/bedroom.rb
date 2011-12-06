class Bedroom < Showroom

  def self.in_room
    where(["products.product_type_id IN (#{ProductType.bedroom_types.map(&:id).join(',')})"])
  end

  def add_bedrooms(product_ids)
    product_ids.each do |product_id|
      self.showroom_products.find_or_create_by_product_id(product_id)
    end
    save
  end
end