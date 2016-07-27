class HomeController < ApplicationController

  def inicio
    buscar_e_persistir_marcas_em_webmotors
  end

  private

  def buscar_e_persistir_marcas_em_webmotors
    # Faz requisição de marcas no site webmotors
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Buscar todas as marcas em Webmotors
    response = Net::HTTP.post_form(uri, {})
    json_marcas = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json_marcas.each do |marca_params|
      if Marca.where(nome: marca_params["Nome"]).size == 0
        Marca.create(nome: marca_params["Nome"], webmotors_id: marca_params["Id"])
      end
    end

    # Retornar todas as marcas no banco de dados
    @marcas = Marca.all

  end

end
