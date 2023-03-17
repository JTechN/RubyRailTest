class Account < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

    # 0 = user, 1 = manager, 2 = admin
  enum :category, asset: "Asset", liability: "Liability", equity: "Equity"
  # enum :subcategory, asset: "Asset", liability: "Liability", equity: "Equity"
  enum :statement, is: "Income Statement", bs: "Balance Sheet" , re: "Retained Earning Statement"
  # after_initialize :set_default_role, :if => :new_record?
  # def set_default_role
  #   self.category ||= :
  # end
end
