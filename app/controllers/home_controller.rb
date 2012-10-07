class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @sensors= Sensor.all
  end
  
  def createMote
    if !params['a0']['id'].empty?
      @a0=Sensor.find(params['a0']['id']).name
    else
      @a0="No sensor"
    end
    if !params['a1']['id'].empty?
      @a1=Sensor.find(params['a1']['id']).name
    else
      @a1="No sensor"
    end
    if !params['a2']['id'].empty?
      @a2=Sensor.find(params['a2']['id']).name
    else
      @a2="No sensor"
    end
    if !params['a3']['id'].empty?
      @a3=Sensor.find(params['a3']['id']).name
    else
      @a3="No sensor"
    end
    if !params['a4']['id'].empty?
      @a4=Sensor.find(params['a4']['id']).name
    else
      @a4="No sensor"
    end
  end
  
  def loadMote
    
  end
end
