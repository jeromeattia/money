class Users < ActiveRecord::Migration
  def up
    create_table "users", :force => true do |t|
      t.string   "name"
      t.string   "email"
      t.string   "encrypted_password"
      t.string   "password_salt"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "admin",              :default => false
      t.string   "password_digest"
      t.string   "remember_token"
      t.string   "provider"
      t.string   "uid"
    end

    add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  end

  def down
  end
end
