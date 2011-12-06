class ShowroomProduct < ActiveRecord::Base

  belongs_to :showroom
  belongs_to :product
  belongs_to :stylist, :class_name => 'User'

  validates :showroom_id, :presence => true
  validates :product_id, :presence => true

  def inactivate
    self.active = false
    save
  end
end
