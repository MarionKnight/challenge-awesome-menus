class MenuItem < ActiveRecord::Base
  attr_accessible :name
  belongs_to :menu

  validates :name, :presence => true, :uniqueness => true
end
