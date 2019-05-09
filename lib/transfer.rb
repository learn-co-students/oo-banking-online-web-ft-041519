require 'pry'

class Transfer
  # your code here

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction

    if @sender.valid? == false
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= amount
      @receiver.balance += amount
      @amount = 0
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
    end
  end

end
