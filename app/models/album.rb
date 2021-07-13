class Album < ApplicationRecord
  validates :title, presence: true
  validates :date_released, presence: true
  validates :artist, length: { minimum: 2 }
  validates :issue_number, presence: true, numericality: { greater_than_or_equal_to: 1}

  def age
    ((Time.now - self.date_released.to_time) / 1.year.seconds).floor
  end
end
