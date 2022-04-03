class AddPhoneColumnToServiceProvider < ActiveRecord::Migration[7.0]
  def change
    add_column :service_providers, :phone, :string
  end
end
