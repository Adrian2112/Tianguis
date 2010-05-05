class CreateAmigos < ActiveRecord::Migration
  def self.up
    create_table :amigos do |t|
      t.integer :amigo_uno_id, :null => false
      t.integer :amigo_dos_id, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :amigos
  end
end
