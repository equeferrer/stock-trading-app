class Broker < User
  has_many :broker_stocks, class_name: "UserStock", foreign_key: :user_id
  has_many :stocks, through: :broker_stocks

  after_create :send_admin_mail

  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end
  
end

