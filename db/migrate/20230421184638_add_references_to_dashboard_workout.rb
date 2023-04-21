class AddReferencesToDashboardWorkout < ActiveRecord::Migration[7.0]
  def change
    add_reference :dashboards, :workout, foreign_key: true
  end
end
