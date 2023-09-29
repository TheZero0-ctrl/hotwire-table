class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :hire_date, :department, presence: true

  enum :department, {
    'Development': 0,
    'QA': 1,
    'Project Management': 2,
    'DevOps': 3
  }
end
