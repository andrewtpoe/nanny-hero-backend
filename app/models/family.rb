class Family < ActiveRecord::Base
  belongs_to :nanny
  has_many :children, dependent: :destroy

  validates :name, :phone_number, :address, :nanny_id, presence: true
  validates :name, uniqueness: true
end
