class Category < ApplicationRecord
has_many :articles

validates :name, presence: true, uniqueness: true

validates :description, presence: { allow_blank: true }
end
