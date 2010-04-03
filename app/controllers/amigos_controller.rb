class AmigosController < ApplicationController
  # GET /amigos
  # GET /amigos.xml
  def index
    @amigos = Amigo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @amigos }
    end
  end

  # GET /amigos/1
  # GET /amigos/1.xml
  def show
    @amigo = Amigo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @amigo }
    end
  end

  # GET /amigos/new
  # GET /amigos/new.xml
  def new
    @amigo = Amigo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @amigo }
    end
  end

  # GET /amigos/1/edit
  def edit
    @amigo = Amigo.find(params[:id])
  end

  # POST /amigos
  # POST /amigos.xml
  def create
    @amigo = Amigo.new(params[:amigo])

    respond_to do |format|
      if @amigo.save
        flash[:notice] = 'Amigo was successfully created.'
        format.html { redirect_to(@amigo) }
        format.xml  { render :xml => @amigo, :status => :created, :location => @amigo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @amigo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /amigos/1
  # PUT /amigos/1.xml
  def update
    @amigo = Amigo.find(params[:id])

    respond_to do |format|
      if @amigo.update_attributes(params[:amigo])
        flash[:notice] = 'Amigo was successfully updated.'
        format.html { redirect_to(@amigo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @amigo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /amigos/1
  # DELETE /amigos/1.xml
  def destroy
    @amigo = Amigo.find(params[:id])
    @amigo.destroy

    respond_to do |format|
      format.html { redirect_to(amigos_url) }
      format.xml  { head :ok }
    end
  end
end
