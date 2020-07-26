class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    # can initialize a Transfer (FAILED - 9)
    # initializes with a sender (FAILED - 10)
    # initializes with a receiver (FAILED - 11)
    # always initializes with a status of 'pending' (FAILED - 12)
    # initializes with a transfer amount (FAILED - 13)

    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    # can check that both accounts are valid (FAILED - 14)
    # calls on the sender and receiver's #valid? methods (FAILED - 15)
    if sender.valid? && receiver.valid? && sender.balance > amount
      true 
    else
      false 
    end 
  end
  
  def execute_transaction
    # can execute a successful transaction between two accounts (FAILED - 16)
    # each transfer can only happen once (FAILED - 17)
    # rejects a transfer if the sender doesn't have a valid account (FAILED - 18)
    if valid? && @status == "pending"
      @sender.balance = @sender.balance - amount
      @receiver.balance = @receiver.balance + amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end

  def reverse_transfer
    # can reverse a transfer between two accounts (FAILED - 19)
    # it can only reverse executed transfers (FAILED - 20)
    if valid? && status == "complete"
      @sender.balance = @sender.balance + amount
      @receiver.balance = @receiver.balance - amount
      @status = "reversed"
    end
  end
  
end
