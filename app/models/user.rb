class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { minimum: 6 }
  validates :email, format: { with: /\A\w+@\w+\.\w{2,3}\z/ }

  # Using comparison:
  # validates :birth_date, comparison: { less_than: Time.zone.today,
  #                                      message: "can't be in the future" }

  # validates :birth_date, comparison: { greater_than: 120.years.ago,
  #                                      message: "can't be more than 120 years ago" }

  # Using custom method validations
  validate :too_old, :not_born

  def too_old
    return unless !birth_date.nil? && birth_date < 120.years.ago

    errors.add(:birth_date, "can't be more than 120 years ago")
  end

  def not_born
    return unless !birth_date.nil? && birth_date > Time.zone.today

    errors.add(:birth_date, "can't be in the future")
  end
end
