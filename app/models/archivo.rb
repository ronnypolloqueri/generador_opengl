class Archivo < ActiveRecord::Base
	validates :nombre, :num_lados, :size_lados, presence: true
	validates :tecla_tx,:tecla_ty,:tecla_tz,
			  :tecla_sx,:tecla_sy,:tecla_sz,
			  :tecla_rx,:tecla_ry,:tecla_rz, length: { maximum: 1 }


	PI = 3.1416

	def include_glut
		'#include <gl/glut.h>'
	end
	def print_color
		"glColor3f(#{color_r.round(2)},#{color_g.round(2)},#{color_b.round(2)});"
	end


	def print_vectores
		@x = Array.new
		@y = Array.new
		radio = get_radio(size_lados, num_lados)
		genera_vectores(num_lados, radio)
		str = genera_texto_vectores(@x, @y, size_lados)
		str.split("\n")
	end

	private
	def genera_texto_vectores(vector_x, vector_y, size_lado)
		str = ""
		str += sprintf("%s","   //Cara frontal\n")
		(0...num_lados-1).each do |i|
			str += sprintf("\tglVertex3f(%5.2f, %5.2f,  #{size_lado/2.0});\n", vector_x[i], vector_y[i])
			str += sprintf("\tglVertex3f(%5.2f, %5.2f,  #{size_lado/2.0});\n", vector_x[i+1], vector_y[i+1])
		end
		str += sprintf("\tglVertex3f(%5.2f, %5.2f,  #{size_lado/2.0});\n", vector_x[num_lados-1], vector_y[num_lados-1])
		str += sprintf("\tglVertex3f(%5.2f, %5.2f,  #{size_lado/2.0});\n", vector_x[0], vector_y[0])

		str += sprintf("%s","   //Cara Posterior\n")
		(0...num_lados-1).each do |i|
			str += sprintf("\tglVertex3f(%5.2f, %5.2f, -#{size_lado/2.0});\n", vector_x[i], vector_y[i])
			str += sprintf("\tglVertex3f(%5.2f, %5.2f, -#{size_lado/2.0});\n", vector_x[i+1], vector_y[i+1])
		end
		str += sprintf("\tglVertex3f(%5.2f, %5.2f, -#{size_lado/2.0});\n", vector_x[num_lados-1], vector_y[num_lados-1])
		str += sprintf("\tglVertex3f(%5.2f, %5.2f, -#{size_lado/2.0});\n", vector_x[0], vector_y[0])

		str += sprintf("%s","   //Union de vertices entre las 2 caras\n")
		(0...num_lados).each do |i|
			str += sprintf("\tglVertex3f(%5.2f, %5.2f, -#{size_lado/2.0});\n", vector_x[i], vector_y[i])
			str += sprintf("\tglVertex3f(%5.2f, %5.2f,  #{size_lado/2.0});\n", vector_x[i], vector_y[i])
		end
		return str
	end


	def get_radio(size_lado, n_lados)
		size_lado*Math.sin(2*PI/n_lados)
	end

	def redondea(numero)
		numero.round(2)
	end

	def genera_vectores(n_lados, radio)
		ang_por_lado = (2*PI)/n_lados
	 	(0...n_lados).each do |i|
	 		@x << redondea((radio*Math.cos(i*( ang_por_lado ) - PI/4 )))
	 		@y << redondea((radio*Math.sin(i*( ang_por_lado ) - PI/4 )))
	 	end
	end

end
