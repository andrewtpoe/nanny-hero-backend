class Nanny < ActiveRecord::Base
  validates :name, presence: true
end
