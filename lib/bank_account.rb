require 'pry'

class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    #can deposit money into its account (FAILED - 5)
    @balance +=amount
  end
  
  def display_balance
    #can display its balance (FAILED - 6)
    "Your balance is $#{@balance}."
  end
  
  def valid?
      #is valid with an open status and a balance greater than 0 (FAILED - 7)
      if @status=="open" && @balance>0
        true
      else
        false 
      end
  end
  
  def close_account
    #can close its account (FAILED - 8)
    @status = "closed"
  end

end
