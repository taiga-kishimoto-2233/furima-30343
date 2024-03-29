class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  belongs_to :category
  belongs_to :states
  belongs_to :charge
  belongs_to :area
  belongs_to :exhibit_date

  validates :name, :text, :category_id, :states_id, :charge_id, :area_id, :exhibit_date_id, :price, :image, presence: true
  validates :category_id, :states_id, :charge_id, :area_id, :exhibit_date_id, numericality: { other_than: 1 }
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
