module EmployeesHelper
  def sort_direction(column)
    return 'asc' unless session.dig('employees_filters', 'sort_by') == column

    params[:direction] == 'asc' ? 'desc' : 'asc'
  end

  def columns
    %w[first_name last_name email department hire_date]
  end
end
