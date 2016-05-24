class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string    :email
      t.string    :title
      t.text      :content
      t.string    :file_name, default: ""
      t.string    :file_ext, default: ""
      t.integer   :user_id
      
      t.timestamps null: false
    end
  end
end
