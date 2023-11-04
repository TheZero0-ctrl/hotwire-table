class EmployeesController < ApplicationController
  def index
    @items_per_page = params[:items] || session.dig('employees_filters', 'items') || 10
    @pagy, @employees = pagy(::Employees::Find.new(Employee.all, params, session).execute, items: @items_per_page)
  end
end
