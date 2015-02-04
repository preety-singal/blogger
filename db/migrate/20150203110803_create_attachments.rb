class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :attachments, :articles
  end
end
