class EmployeesController < ApplicationController
  def index
    @pagy, @employees = pagy(Employee.all, items: 10)
  end
end
