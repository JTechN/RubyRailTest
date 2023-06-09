class Account < ApplicationRecord


    # 0 = user, 1 = manager, 2 = admin
  enum :category, asset: "Asset", liability: "Liability", equity: "Equity"
  # enum :subcategory, asset: "Asset", liability: "Liability", equity: "Equity"
  enum :statement, is: "Income Statement", bs: "Balance Sheet" , re: "Retained Earning Statement"

  validates_uniqueness_of :number, :name



end
