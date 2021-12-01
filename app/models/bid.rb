class Bid < ApplicationRecord
  belongs_to :product
  has_many :offers
  
  has_one :active_bid, -> { where(state: 'actived') } 

  validates :initial_price, numericality: { greater_than_or_equal_to: 50000 }
  validates :start_date, 
            :end_date, presence: true
  validate :right_start_date, :right_end_date

  scope :starting, -> { where("start_date <= ?", DateTime.current) }
  
  scope :waiting, -> { where(state: 'waiting') }
  scope :active, -> { where(state: 'actived') }
  
  scope :finished, -> { where("end_date <= ?", DateTime.current) }

  scope :closed, -> {where("state == ?",'closed')}
  

  def right_start_date
    if self.start_date < DateTime.current || (self.start_date.min != 0 && self.start_date.min != 30)
      errors.add(:start_date, :invalid, message: "***Revoyez svp la date ou l'heure de début !***")
    end
  end

  def right_end_date
    if self.end_date <= start_date || (self.end_date.min != 0 && self.end_date.min != 30)
      errors.add(:end_date, :invalid, message: "***Revoyez svp la date ou l'heure de fin !***")
    end
  end

  def winner
    if self.finished
      return self.offers.top
    end
    raise self.offers.top.inspect
  end

end
