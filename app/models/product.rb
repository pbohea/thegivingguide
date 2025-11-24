# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :decimal(, )
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  # Associations
  has_and_belongs_to_many :gift_guides
  has_many :experiences
  has_one_attached :image

  # Validations
  validates :name, presence: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
