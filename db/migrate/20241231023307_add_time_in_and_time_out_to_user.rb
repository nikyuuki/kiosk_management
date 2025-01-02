class AddTimeInAndTimeOutToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :time_in, :datetime
    add_column :users, :time_out, :datetime
    add_column :users, :duration, :string
    add_column :users, :kiost_id, :integer
  end
end
