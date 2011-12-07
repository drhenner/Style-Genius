class Livingroom < Showroom


  def self.in_room
    where(["products.product_type_id IN (#{ProductType.livingroom_types.map(&:id).join(',')})"])
  end

  def add_livingrooms(product_ids)
    product_ids.each do |product_id|
      self.showroom_products.find_or_create_by_product_id(product_id)
    end
    save
  end

end