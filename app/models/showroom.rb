class Showroom < ActiveRecord::Base

  has_many :all_showroom_products, :class_name => 'ShowroomProduct'

  has_many :showroom_products, :conditions => {:showroom_products => { :active => true }}
  has_many :products, :through => :showroom_products, :conditions => [" products.active = ?", true]
  belongs_to :user

  validates :user_id, :presence => true

  def has_product?(product_id)
    showroom_products.any?{|sp| sp.product_id == product_id}
  end
end
