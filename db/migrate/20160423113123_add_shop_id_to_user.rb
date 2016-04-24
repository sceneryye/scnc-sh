class AddShopIdToUser < ActiveRecord::Migration
  def change
    add_column :sdb_pam_account, :shop_id, :integer, index: true, limit: 7
    add_column :sdb_pam_account, :role, :integer, limit: 2, default: 0
    add_column :sdb_pam_account, :wechat_openid, :string, limit: 40
    add_column :sdb_pam_account, :wechat_nickname, :string, limit: 30
    add_column :sdb_pam_account, :wechat_avatar, :string
  end
end
