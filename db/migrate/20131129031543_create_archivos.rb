class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.string :nombre

      t.integer :color_r
      t.integer :color_g
      t.integer :color_b

      t.integer :num_lados
      t.integer :size_lados

      t.string :tecla_tx, limit: 1, default: 'r'
      t.string :tecla_ty, limit: 1, default: 't'
      t.string :tecla_tz, limit: 1, default: 'y'

      t.string :tecla_sx, limit: 1, default: 'g'
      t.string :tecla_sy, limit: 1, default: 'h'
      t.string :tecla_sz, limit: 1, default: 'j'

      t.string :tecla_rx, limit: 1, default: 'b'
      t.string :tecla_ry, limit: 1, default: 'n'
      t.string :tecla_rz, limit: 1, default: 'm'

      t.timestamps
    end
  end
end
