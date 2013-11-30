class ArchivosController < ApplicationController
  def index
  	@archivos = Archivo.all
  end

  def new
  	@archivo = Archivo.new
  end

  def create
  	@archivo = Archivo.new(archivo_params)
  	if @archivo.save
  		render archivo_path(@archivo)
  	else
  		render @archivo.errors.inspect
  	end
  end

  def show
  	@archivo = Archivo.find(params[:id])
  end

  private
  def archivo_params
     params.require(:archivo).permit(:nombre, :num_lados, :size_lados, :color_r, :color_g, :color_b)
  end
end
