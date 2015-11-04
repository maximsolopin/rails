class Ticket < ActiveRecord::Base
  belongs_to :train, inverse_of: :tickets
  belongs_to :departure_statition, class_name: 'RailwayStation', foreign_key: :departure_statition_id
  belongs_to :arrival_statition, class_name: 'RailwayStation', foreign_key: :arrival_statition_id
  belongs_to :user

  after_create :send_notification
  after_destroy :send_notification_remove

  def route_name
    "#{departure_statition.title} - #{arrival_statition.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_remove
    TicketsMailer.remove_ticket(self.user, self).deliver_now
  end
end
