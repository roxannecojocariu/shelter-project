class Shelter <ApplicationRecord
  has_many :users
  validates :name, :slug, :address, presence: true
end
