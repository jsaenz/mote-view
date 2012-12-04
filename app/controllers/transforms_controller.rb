class TransformsController < ApplicationController
  before_filter :authenticate_user!
  
  
  # GET /transforms
  # GET /transforms.json
  def index
    @transforms = Transform.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transforms }
    end
  end


  # GET /transforms/1
  # GET /transforms/1.json
  def show
    @transform = Transform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transform }
    end
  end


  # GET /transforms/new
  # GET /transforms/new.json
  def new
    @transform = Transform.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transform }
    end
  end


  # GET /transforms/1/edit
  def edit
    @transform = Transform.find(params[:id])
  end


  # POST /transforms
  # POST /transforms.json
  def create
    @transform = Transform.new(params[:transform])

    respond_to do |format|
      if @transform.save
        format.html { redirect_to @transform, notice: 'Transform was successfully created.' }
        format.json { render json: @transform, status: :created, location: @transform }
      else
        format.html { render action: "new" }
        format.json { render json: @transform.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /transforms/1
  # PUT /transforms/1.json
  def update
    @transform = Transform.find(params[:id])

    respond_to do |format|
      if @transform.update_attributes(params[:transform])
        format.html { redirect_to @transform, notice: 'Transform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transform.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /transforms/1
  # DELETE /transforms/1.json
  def destroy
    @transform = Transform.find(params[:id])
    @transform.destroy

    respond_to do |format|
      format.html { redirect_to transforms_url }
      format.json { head :no_content }
    end
  end
  
end
