class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: ['new', 'in-progress', 'done'] }
  validates :user, presence: true

  STATUS_OPTIONS = [
    ['new', 'new'],
    ['in progress', 'in-progress'],
    ['done', 'done']
  ]
end
