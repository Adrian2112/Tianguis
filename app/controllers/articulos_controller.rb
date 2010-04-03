class ArticulosController < ApplicationController
  
  def new
    @usuario = Usuario.find(session[:user_id])
    @articulo = @usuario.articulos.build(:vendedor_id => @usuario.id)
  end

  # GET /articulos/1/edit
  def edit
    @articulo = Articulo.find(params[:id])
  end

  # POST /articulos
  # POST /articulos.xml
  def create
    @articulo = Articulo.new(params[:articulo])

    respond_to do |format|
      if @articulo.save
        flash[:notice] = 'Tu articulo se publico correctamente.'
        format.html { redirect_to perfil_path }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /articulos/1
  # PUT /articulos/1.xml
  def update
    @articulo = Articulo.find(params[:id])

    respond_to do |format|
      if @articulo.update_attributes(params[:articulo])
        flash[:notice] = 'Articulo was successfully updated.'
        format.html { redirect_to(@articulo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @articulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.xml
  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy

    respond_to do |format|
      format.html { redirect_to(articulos_url) }
      format.xml  { head :ok }
    end
  end
end
