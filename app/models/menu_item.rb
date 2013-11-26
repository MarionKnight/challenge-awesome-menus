class MenuItem < ActiveRecord::Base
  attr_accessible :name, :price
  belongs_to :menu

  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true
end
