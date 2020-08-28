class BankAccount

  @@all_accounts = []

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
    @@all_accounts << self
  end

  def deposit(num)
    self.balance = self.balance + num
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == 'open' && self.balance > 0
  end

  def close_account
    self.status = 'closed'
  end

  def self.all
    @@all_accounts
  end

end
