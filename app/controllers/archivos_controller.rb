class ArchivosController < ApplicationController
  http_basic_authenticate_with name: "ronny", password: "seelmejor", except: [:show, :create, :new, :ejercicio2_v1]

  def index
  	@archivos = Archivo.all
  end

  def new
  	@archivo = Archivo.new
  end

  def create
  	@archivo = Archivo.new(archivo_params)
  	if @archivo.save
  		redirect_to @archivo
  	else
  		render "new"
  	end
  end

  def show
    @archivo =Archivo.find(params[:id])
    @archivo.visitas += 1
    @archivo.save
    unless @archivo.revisado
       @archivo.revisado = true
       @archivo.save
    else
       render "new"
    end
  end

  def ejercicio2_v1
  end

  private
  def archivo_params
     params.require(:archivo).permit(:nombre, :num_lados, :size_lados, :color_r, :color_g, :color_b, :tecla_tx, :tecla_ty, :tecla_tz, :tecla_sx,:tecla_sy,:tecla_sz,  :tecla_rx,:tecla_ry,:tecla_rz)
  end
end
