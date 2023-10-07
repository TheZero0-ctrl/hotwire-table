# frozen_string_literal: true

module Employees
  class Find
    attr_reader :search, :scope, :department

    def initialize(scope, params)
      @scope = scope
      @department = params[:department]
      @search = params[:search]
    end

    def execute
      employees = filter_by_department(scope)
      search_quotes(employees)
    end

    def search_quotes(employees)
      return employees if search.blank?

      employees.where('first_name ILIKE :search OR last_name ILIKE :search OR email ILIKE :search', search: "%#{search}%")
    end

    def filter_by_department(employees)
      return employees if department.blank?

      employees.where(department: department)
    end
  end
end
