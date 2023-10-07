class EmployeesController < ApplicationController
  def index
    @pagy, @employees = pagy(::Employees::Find.new(Employee.all, params).execute, items: 10)
  end
end
