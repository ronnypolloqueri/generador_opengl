class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.string :nombre

      t.decimal :color_r
      t.decimal :color_g
      t.decimal :color_b

      t.integer :num_lados, default: 4
      t.integer :size_lados, default: 5

      t.string :tecla_tx, limit: 1, default: 'q'
      t.string :tecla_ty, limit: 1, default: 'w'
      t.string :tecla_tz, limit: 1, default: 'e'

      t.string :tecla_sx, limit: 1, default: 'g'
      t.string :tecla_sy, limit: 1, default: 'h'
      t.string :tecla_sz, limit: 1, default: 'j'

      t.string :tecla_rx, limit: 1, default: 'c'
      t.string :tecla_ry, limit: 1, default: 'v'
      t.string :tecla_rz, limit: 1, default: 'b'

      t.boolean :revisado, default: false

      t.integer :visitas, default: 0

      t.timestamps
    end
  end
end
