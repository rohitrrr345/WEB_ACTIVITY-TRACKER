class ActivityLog < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :duration, presence: true
end
