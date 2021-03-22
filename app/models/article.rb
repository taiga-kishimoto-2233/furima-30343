class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :states
  belongs_to :charge
  belongs_to :area
  belongs_to :date

  validates :category, :states, :charge, :area, :date, presence: true
  validates :category_id, :states_id, :charge_id, :area_id, :date_id, numericality: { other_than: 1 }
end
