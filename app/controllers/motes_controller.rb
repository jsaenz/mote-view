class MotesController < ApplicationController
  # GET /motes
  # GET /motes.json
  def index
    @motes = Mote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motes }
    end
  end

  # GET /motes/1
  # GET /motes/1.json
  def show
    @mote = Mote.find(params[:id])
    @mote.ports.sort! { |a,b| a.portNumber <=> b.portNumber }
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mote }
    end
  end

  # GET /motes/upload
  # GET /motes/upload.json
  def upload
    @mote = mote.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mote }
    end
  end

  # GET /motes/new
  # GET /motes/new.json
  def new
    @mote = Mote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @radio }
    end
  end

  # GET /motes/1/edit
  def edit
    @mote = Mote.find(params[:id])
  end
  

  # POST /motes
  # POST /motes.json
  def create
    @mote = Mote.new(params[:mote])

    respond_to do |format|
      if @mote.save
        format.html { redirect_to @mote, notice: 'Mote was successfully created.' }
        format.json { render json: @mote, status: :created, location: @mote }
      else
        format.html { render action: "new" }
        format.json { render json: @mote.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /motes/1
  # PUT /motes/1.json
  def update
    @mote = Mote.find(params[:id])
    respond_to do |format|
      if @mote.update_attributes(params[:mote])
        format.html { redirect_to @mote, notice: 'Mote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mote.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /motes/1
  # DELETE /motes/1.json
  def destroy
    @mote = Mote.find(params[:id])
    @mote.destroy

    respond_to do |format|
      format.html { redirect_to motes_url }
      format.json { head :no_content }
    end
  end
  
  
  def download
    @mote = Mote.find(params[:id])
    send_data @mote.to_json, :type => "text/json", :filename => @mote.name+'.json'
  end
end
