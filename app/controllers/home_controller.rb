class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  MOTE_JSON_REGEX = /{\s*name:(\w+),\s*radio:(\w+)
                       (,\s*(sensors:{.*}),\s*(transforms:{.*}))?\s*}/x

  SENSOR_REGEX = /.*/x
  TRANSFORM_REGEX = /.*/x


  def index
    @sensors = Sensor.all
    @radios = Radio.all
    @transforms = Transform.all
  end
  
  def createMote
    if !params['radio']['id'].empty?
      @radio=Radio.find(params['radio']['id']).name
    else
      @radio="No radio"
    end
    if !params['sa0']['id'].empty?
      @sa0=Sensor.find(params['sa0']['id']).name
    else
      @sa0="No sensor"
    end
    if !params['sa1']['id'].empty?
      @sa1=Sensor.find(params['sa1']['id']).name
    else
      @sa1="No sensor"
    end
    if !params['sa2']['id'].empty?
      @sa2=Sensor.find(params['sa2']['id']).name
    else
      @sa2="No sensor"
    end
    if !params['sa3']['id'].empty?
      @sa3=Sensor.find(params['sa3']['id']).name
    else
      @sa3="No sensor"
    end
    if !params['sa4']['id'].empty?
      @sa4=Sensor.find(params['sa4']['id']).name
    else
      @sa4="No sensor"
    end
    if !params['ta0']['id'].empty?
      @ta0 = Transform.find(params['ta0']['id']).name
    else
      @ta0="No transform"
    end
    if !params['ta1']['id'].empty?
      @ta1 = Transform.find(params['ta1']['id']).name
    else
      @ta1="No transform"
    end
    if !params['ta2']['id'].empty?
      @ta2 = Transform.find(params['ta2']['id']).name
    else
      @ta2="No transform"
    end
    if !params['ta3']['id'].empty?
      @ta3 = Transform.find(params['ta3']['id']).name
    else
      @ta3="No transform"
    end
    if !params['ta4']['id'].empty?
      @ta4 = Transform.find(params['ta4']['id']).name
    else
      @ta4="No transform"
    end
  end
  
  def loadMote
    if params[:file]
      lines = params[:file].tempfile.readlines.map(&:chomp) #readlines from file & removes newline symbol
      lines.each do |l| 
        m = l.match(MOTE_JSON_REGEX) #parse line 
        mote = Mote.create name: m[1], radio: m[2]
        if m[3]
          if m[4] { sensors = m[4].match(SENSOR_REGEX) }
          if m[5] { transforms = m[5].match(TRANSFORM_REGEX) }
        end
      end
    end
  end
end
