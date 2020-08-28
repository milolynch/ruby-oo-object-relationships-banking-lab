class Transfer

  attr_reader :sender, :receiver, :amount

  attr_accessor :status

  def initialize(person1, person2, amount)
    @sender = person1
    @receiver = person2
    @status = 'pending'
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction

    if self.valid? && self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      self.sender.close_account
      self.receiver.close_account
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end




end

#milo = BankAccount.new("milo")
#tej = BankAccount.new("tej")

#move_money = Transfer.new("milo","tej", 100)
