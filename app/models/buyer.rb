class Buyer < User
  has_many :buyer_stocks, foreign_key: :user_id
  has_many :user_stocks, through: :buyer_stocks

  has_many :transactions, foreign_key: :user_id

  before_create :approve_buyer
  after_create :send_admin_mail

  def approve_buyer
    self.approved = true
  end

  def send_admin_mail
    AdminMailer.account_approval(email).deliver
  end
end
