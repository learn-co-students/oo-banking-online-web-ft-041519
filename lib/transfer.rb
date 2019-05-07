class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if !valid? || sender.balance <= amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif valid? && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
  end 
    
  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
    
end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    