class BankAccount

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name 
    @name
  end

  def balance
    @balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def balance=(balance)
    @balance = balance
  end
 

  def status
    @status
  end

  def status=(status)
    @status = status
  end

  def deposit(amount)
    self.balance= self.balance + amount
  end

  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status="closed"
  end


end
