class Archivo < ActiveRecord::Base
	validates :nombre, :num_lados, :size_lados, presence: true
	validates :tecla_tx,:tecla_ty,:tecla_tz,
			  :tecla_sx,:tecla_sy,:tecla_sz,
			  :tecla_rx,:tecla_ry,:tecla_rz, length: { maximum: 1 }
end
