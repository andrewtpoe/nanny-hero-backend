class Child < ActiveRecord::Base
  belongs_to :family

  validates :name, :family_id, presence: true
end
