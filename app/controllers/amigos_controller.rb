class AmigosController < ApplicationController
  def index
    @amigos = Amigo.all
  end

  def new
    @amigo = Amigo.new
  end

  def edit
    @amigo = Amigo.find(params[:id])
  end

  def create
    @amigo = Amigo.new(params[:amigo])

    respond_to do |format|
      if @amigo.save
        flash[:notice] = 'Amigo was successfully created.'
        format.html { redirect_to(@amigo) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @amigo = Amigo.find(params[:id])

    respond_to do |format|
      if @amigo.update_attributes(params[:amigo])
        flash[:notice] = 'Amigo was successfully updated.'
        format.html { redirect_to(@amigo) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @amigo = Amigo.find(params[:id])
    @amigo.destroy

    respond_to do |format|
      format.html { redirect_to(amigos_url) }
    end
  end
end
