require 'pry'

class Transfer
  
  attr_accessor :status, :amount
  attr_reader :sender, :receiver  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
    # binding.pry 
    @sender.valid? == @receiver.valid? ? true : false
  end 
  
  def execute_transaction
    # binding.pry
    if @status == "pending" && valid? && @sender.balance >= amount 
      @sender.balance -= amount  
      @receiver.balance += amount 
      self.status = "complete"
     else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
    def reverse_transfer
       # binding.pry
      if @status == "complete"
        @receiver.balance -= amount
        @sender.balance += amount
        self.status = "reversed"
      end 
    end 
end
