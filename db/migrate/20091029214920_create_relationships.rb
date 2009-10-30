class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.belongs_to :contact
      t.belongs_to :group
      t.string :note
      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
