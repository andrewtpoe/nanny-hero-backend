class Nanny < ActiveRecord::Base
  has_many :families

  validates :name, presence: true
end
