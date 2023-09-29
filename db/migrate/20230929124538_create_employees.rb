class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :department, null: false, default: 0
      t.datetime :hire_date

      t.timestamps
    end
  end
end
