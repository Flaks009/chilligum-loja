# frozen_string_literal: true

# ProdutosController - Controlador pagina produtos

class ProdutosController < ApplicationController
  before_action :authenticate_user!, only: %i[edit create new update destroy]
  before_action :set_produto, only: %i[show edit update destroy]

  # GET /produtos
   def index
    @produtos = if params[:term]
                  Produto.where('nome ILIKE ?', "%#{params[:term]}%").page(params['page']).per(3)
                else
                  Produto.all.page(params['page']).per(3)
                end
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)
    @produto.user = current_user

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /produtos/1
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_produto
    @produto = Produto.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def produto_params
    params.require(:produto).permit(:nome, :preco, :desc, :image, :term, :user)
  end
end
