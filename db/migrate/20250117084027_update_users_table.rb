class UpdateUsersTable < ActiveRecord::Migration[7.1]
  def change
    # অতিরিক্ত কলাম সরানো
    add_column :users, :otp_secret_key, :string
    add_column :users, :user_type, :integer
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :sign_in_count, :integer

    # নতুন কলাম যোগ করা
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :address, :text
    remove_column :users, :mobile_no, :string
    remove_column :users, :district, :string
  end
end