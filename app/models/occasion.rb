# == Schema Information
#
# Table name: occasions
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Occasion < ApplicationRecord
  # Associations
  has_many :gift_guides, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
end
