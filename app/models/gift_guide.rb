# == Schema Information
#
# Table name: gift_guides
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  occasion_id :bigint           not null
#
# Indexes
#
#  index_gift_guides_on_occasion_id  (occasion_id)
#
# Foreign Keys
#
#  fk_rails_...  (occasion_id => occasions.id)
#
class GiftGuide < ApplicationRecord
  # Associations
  belongs_to :occasion, optional: true
  has_and_belongs_to_many :products
  has_many :experiences
  has_one_attached :image

  # Validations
  validates :caption, presence: true
  validates :image, presence: true

  # Scopes
  default_scope { order(position: :asc) }
end
