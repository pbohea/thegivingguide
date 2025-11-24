# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable

  # Associations
  has_many :recipients, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :consultation_requests, dependent: :destroy

  # Validations
  validate :password_complexity

  private

  def password_complexity
    return if password.blank?

    unless password.length.between?(8, 20)
      errors.add :password, "must be between 8 and 20 characters"
    end

    unless password.match?(/(?=.*[a-z])(?=.*[A-Z])/)
      errors.add :password, "must include at least one lowercase and one uppercase letter"
    end
  end
end
