class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :hire_date, :department, presence: true

  enum :department, {
    'Development': 0,
    'DevOps': 1,
    'Project Management': 2,
    'QA': 3
  }
end
