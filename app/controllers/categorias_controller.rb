class CategoriasController < ApplicationController
  
  def index
    @categorias = Categoria.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @categoria = Categoria.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def create
    @categoria = Categoria.new(params[:categoria])

    respond_to do |format|
      if @categoria.save
        flash[:notice] = 'Categoria was successfully created.'
        format.html { redirect_to(@categoria) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        flash[:notice] = 'Categoria was successfully updated.'
        format.html { redirect_to(@categoria) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    respond_to do |format|
      format.html { redirect_to(categorias_url) }
    end
  end
end
