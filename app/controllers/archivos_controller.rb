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
  		redirect_to @archivo
  	else
  		render 'new'
  	end
  end

  def show
  end

  private
  def archivo_params
     params.require(:archivo).permit(:all)
  end
end
