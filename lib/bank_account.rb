class BankAccount
  @@account = []
  attr_accessor :balance, :status
  attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
  
  @@account << self
end

def deposit(amount)
  @@account << @balance += amount
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  @status == "open" && @balance > 0
end

def close_account
  @status = "closed"
end
end
