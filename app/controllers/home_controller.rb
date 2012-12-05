# Controler for static 'home' pages
# @author Jon Saenz
class HomeController < ApplicationController
  #before_filter :authenticate_user!
  
  #MOTE_JSON_REGEX = /{\s*name:(\w+),\s*radio:(\w+)
                #       (,\s*(sensors:{.*}),\s*(transforms:{.*}))?\s*}/x

  #SENSOR_REGEX = /.*/x
  #TRANSFORM_REGEX = /.*/x

  def index
    @sensors = Sensor.all
    @radios = Radio.all
    @transforms = Transform.all
  end
  
    
  def setName
    @mote = Mote.new
  end

  def post_name
  end

  
  def setSensor
    @mote = Mote.find(params[:id])
    @sensors = Sensor.all
    if @sensors.nil? or @sensors.empty?
      flash.now[:alert] = "There are no sensors to add to your mote. Have an Administrator add a Sensor."
    end
  end


  def post_sensor
    success = true;
    @mote = Mote.find(params[:mote])
    # check to see if port number is used already
    @sensor = Sensor.where(name: params[:sensor]).first
    @port = @mote.ports.where(portNumber: params[:portNum]).first
    if @port
      @port.sensor = @sensor
      # If the port gets a new sensor we remove the transforms
      @port.transforms.delete(@port.transforms)
    else
      @port = @mote.ports.build(sensor: @sensor, portNumber: params[:portNum])
    end
    success = success and @port.save
    @mote.ports.sort! { |a,b| a.portNumber <=> b.portNumber }
    respond_to do |format|
      if success
        format.html { render text: 'Success' }
        format.json { render nothing: true }
      else
        format.html { render text: 'FAILURE'}
        format.json { render nothing: true }
      end
    end
  end

  
  def setRadio
    @mote = Mote.find(params[:id])
    @radios = Radio.all
    if @radios.nil? or @radios.empty?
      flash.now[:alert] = "There are no radios to add to your mote. Have an Administrator add a Radio."
    end
  end


  def post_radio
    @radio = Radio.find(params[:radio])
    @radio.motes << Mote.find(params[:mote])
    respond_to do |format|
      if @radio.save
        format.html { render text: 'Success' + @radio.motes.to_s}
        format.json { render nothing: true }
      else
        format.html { render text: 'FAILURE'}
        format.json { render nothing: true }
      end
    end
  end

  
  def setTransform
    @mote = Mote.find(params[:id])
    @transforms = Transform.all

    if @transforms.nil? or @transforms.empty?
      flash.now[:alert] = "There are no transformations to add to your mote. Have an Administrator add a Transformation."
    end
  end


 def post_transform
    @port = Port.find(params[:port])
    @transform = @port.transforms.where(name: params[:transform]).first
    added = false
    if !@transform
      added = true
      @transform = Transform.where(name: params[:transform]).first
      @port.transforms << @transform
    end
    respond_to do |format|
      if added
        format.html { render text: 'success' }
        format.json { render nothing: true }
      else
        format.html { render text: 'notmodified'}
        format.json { render nothing: true }
      end
    end
  end
  
end
