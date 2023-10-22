# frozen_string_literal: true

module Employees
  class Find
    attr_reader :search, :scope, :department, :sort_by, :direction

    def initialize(scope, params)
      @scope = scope
      @department = params[:department]
      @search = params[:search]
      @sort_by = params[:sort_by]
      @direction = params[:direction]
    end

    def execute
      employees = filter_by_department(scope)
      employees = search_employees(employees)
      sort_employees(employees)
    end

    def search_employees(employees)
      return employees if search.blank?

      employees.where('first_name ILIKE :search OR last_name ILIKE :search OR email ILIKE :search', search: "%#{search}%")
    end

    def filter_by_department(employees)
      return employees if department.blank?

      employees.where(department: department)
    end

    def sort_employees(employees)
      return employees if sort_by.blank? || direction.blank?

      employees.order("#{sort_by} #{direction}")
    end
  end
end
