class ModelosController < ApplicationController

  def inicio
    buscar_e_persistir_modelos_em_webmotors
  end

  private

  def buscar_e_persistir_modelos_em_webmotors
    # Requisição de modelos WebMotors
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # Requisição de identificador de modelo passado por GET 
    marca = Marca.where(webmotors_id: params[:codigo_modelo])[0]

    response = Net::HTTP.post_form(uri, { marca: params[:codigo_modelo] })
    modelos_json = JSON.parse response.body

    # Itera no resultado e grava os modelos que ainda não estão persistidos
    modelos_json.each do |json|
      if Modelo.where(nome: json["Nome"], marca_id: marca.id).size == 0
        Modelo.create(marca_id: marca.id, nome: json["Nome"])
      end
    end

    # Retorna modelos encontrados
    @modelos = Modelo.where(marca_id: marca.id).page params[:page]

  end

end
