# == Schema Information
#
# Table name: consultation_requests
#
#  id         :bigint           not null, primary key
#  email      :string
#  message    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_consultation_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ConsultationRequest < ApplicationRecord
  # Associations
  belongs_to :user, optional: true

  # Validations
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true
end
