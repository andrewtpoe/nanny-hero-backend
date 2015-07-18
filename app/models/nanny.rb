class Nanny < ActiveRecord::Base
  has_many :families, dependent: :destroy

  validates :name, presence: true
end
