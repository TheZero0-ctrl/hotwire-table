# frozen_string_literal: true

module Employees
  class Find
    attr_reader :search, :scope, :department, :sort_by, :direction, :session, :params

    def initialize(scope, params, session)
      @session = session
      @params = params
      store_filters
      @scope = scope
      @department = session.dig('employees_filters', 'department')
      @search = session.dig('employees_filters', 'search')
      @sort_by = session.dig('employees_filters', 'sort_by')
      @direction = session.dig('employees_filters', 'direction')
    end

    def execute
      employees = filter_by_department(scope)
      employees = search_employees(employees)
      sort_employees(employees)
    end

    def store_filters
      session['employees_filters'] = {} unless session.key?('employees_filters')
      session['employees_filters'].merge!(filter_params)
    end

    def filter_params
      params.permit(:search, :department, :items_per_page, :sort_by, :direction, :page)
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
