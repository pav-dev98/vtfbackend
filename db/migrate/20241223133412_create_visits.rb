class CreateVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :visits do |t|
      t.string :school
      t.string :contact_name
      t.string :email
      t.string :phone
      t.datetime :visit_date
      t.integer :students_count
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
