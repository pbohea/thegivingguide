# == Schema Information
#
# Table name: recipients
#
#  id         :bigint           not null, primary key
#  age_group  :string
#  interests  :text
#  sex        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_recipients_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Recipient < ApplicationRecord
  # Associations
  belongs_to :user, optional: true

  # Validations
  validates :age_group, presence: true
  validates :sex, presence: true

  # Scopes
  scope :generic, -> { where(user_id: nil) }
  scope :user_specific, -> { where.not(user_id: nil) }
end
