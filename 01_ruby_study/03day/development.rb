class Department < ActiveRecord::Base
  has_many :employees
  has_one :manager

  def self.has_many(i)
    # code here
  end

  def self.has_one(i)
    # code here
  end

end