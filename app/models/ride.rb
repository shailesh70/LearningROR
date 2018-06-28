class Ride < ActiveRecord::Base
  belongs_to :user_id
  before_save :downcase_fields
  attr_accessible :about_ride, :date_of_journey, :destination, :price, :seats, :source, :stoppage_city, :time
  
  validates :source,presence: true
  validates :destination,presence: true
  validates :date_of_journey, presence: true
  validates :price, presence: true
  validates :time, presence: true
  validates :seats, presence: true


private
  def downcase_fields
    self.source.downcase!
    self.destination.downcase!
  end

end
