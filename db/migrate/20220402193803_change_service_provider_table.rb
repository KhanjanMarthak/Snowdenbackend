class ChangeServiceProviderTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :service_providers, :working_hours, :start_time
    add_column :service_providers, :end_time, :string
  end
end
