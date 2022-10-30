class Company < ApplicationRecord
  validates :name, :url, presence: true

  has_one_attached :logo

  belongs_to :user
  has_many :positions
end
