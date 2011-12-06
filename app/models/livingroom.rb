class Livingroom < Showroom


  def self.in_room
    where(["products.product_type_id IN (#{ProductType.livingroom_types.map(&:id).join(',')})"])
  end
end