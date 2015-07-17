class Family < ActiveRecord::Base
  has_one :nanny
  has_many :children

  validates :name, :phone_number, :address, presence: true
end
