class Transfer

  @@account = []
  
  attr_accessor :sender, :receiver, :amount, :status
 

def initialize(sender, receiver, amount = 50, status ="pending")
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = status
  
  @@account << self
end

def valid?
  if @amount >= 50 || @status == "open"
     if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
end

def execute_transaction
#sender.balance -= amount || receiver.balance += amount
 if valid? && status == "pending"
      if @amount < self.sender.balance
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
    else
   # !(sender.valid?)
    @status = "rejected"
   "Transaction rejected. Please check your account balance."
   end
  end
end

def reverse_transfer
  if status == "complete"
     @receiver.balance -= amount
        @sender.balance += amount
        @status = "reversed"
end
end
end
