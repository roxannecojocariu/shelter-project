class Shelter <ApplicationRecord
  has_one :User
  validates :name, :slug, :address, presence: true
end
