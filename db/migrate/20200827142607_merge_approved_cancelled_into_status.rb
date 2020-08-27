class MergeApprovedCancelledIntoStatus < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :approved
    remove_column :reservations, :cancelled
    add_column :reservations, :status, :string, default: "Pending"
  end
end
