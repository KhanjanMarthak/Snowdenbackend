class AddPhonecolumnToConsumer < ActiveRecord::Migration[7.0]
  def change
    add_column :consumers, :phone, :string
  end
end
