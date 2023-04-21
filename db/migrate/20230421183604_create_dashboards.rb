class CreateDashboards < ActiveRecord::Migration[7.0]
  def change
    create_table :dashboards do |t|
      t.string :score

      t.timestamps
    end
  end
end
