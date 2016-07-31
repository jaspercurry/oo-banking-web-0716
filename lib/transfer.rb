class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def status
    @status
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def amount
    @amount
  end

  def status=(status)
    @status = status
  end 

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction

    if self.status == "pending" && amount < sender.balance
    self.sender.deposit(self.amount * -1)
    self.receiver.deposit(self.amount)
    self.status="complete"
    else
      self.status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.deposit(self.amount)
    self.receiver.deposit(self.amount * -1)
    self.status = "reversed"
    else
      "This transaction was never performed - please contact your bank for more information :)"
    end
  end
end
