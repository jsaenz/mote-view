class HomeController < ApplicationController
  before_filter :authenticate_user!
  
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
    
  end
end
