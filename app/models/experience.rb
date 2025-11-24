# == Schema Information
#
# Table name: experiences
#
#  id            :bigint           not null, primary key
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  gift_guide_id :bigint
#  product_id    :bigint
#  user_id       :bigint           not null
#
# Indexes
#
#  index_experiences_on_gift_guide_id  (gift_guide_id)
#  index_experiences_on_product_id     (product_id)
#  index_experiences_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (gift_guide_id => gift_guides.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Experience < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :product, optional: true
  belongs_to :gift_guide, optional: true

  # Validations
  validates :content, presence: true
  validate :must_have_product_or_gift_guide

  private

  def must_have_product_or_gift_guide
    if product_id.blank? && gift_guide_id.blank?
      errors.add(:base, "Experience must be associated with either a product or a gift guide")
    end
  end
end
