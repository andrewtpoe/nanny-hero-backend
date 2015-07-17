class Family < ActiveRecord::Base
  validates :name, :phone_number, :address, presence: true
end
