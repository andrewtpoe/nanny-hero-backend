class Child < ActiveRecord::Base
  validates :name, :family_id, presence: true
end
