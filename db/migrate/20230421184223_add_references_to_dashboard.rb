class AddReferencesToDashboard < ActiveRecord::Migration[7.0]
  def change
    add_reference :dashboards, :member, foreign_key: true
  end
end
