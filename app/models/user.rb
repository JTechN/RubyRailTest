class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 0 = user, 1 = manager, 2 = admin
  enum role: [:Accountant, :Manager, :Admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :Accountant
  end



  #password reqs solution
  validate :password_complexity
  def password_complexity
    return if password.blank? || password =~ /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z][A-Za-z\d@$!%*#?&]{7,49}$/
    errors.add :password, 'Password must be a minimum of 8 characters, must start with a letter, must have a letter, a number, and a special character'
  end

end
