require 'pry'

class Transfer
  # your code here

  attr_reader :sender, :receiver, :amount, :status, :transaction_amount

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
    if @sender.valid? == true && @sender.balance >= amount
      @sender.balance -= amount
      @receiver.balance += amount
      @transaction_amount = amount
      @amount = 0
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @transaction_amount
      @receiver.balance -= @transaction_amount
      @status = "reversed"
    end
  end

end
