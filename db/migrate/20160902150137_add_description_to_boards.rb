class AddDescriptionToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :description, :string, null: false, default: "enter description"
  end
end
