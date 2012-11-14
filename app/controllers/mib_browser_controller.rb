class MibBrowserController < ApplicationController
  def index
    @mibs = SNMP::Manager.new.mib.by_name
  end
  
  def snmp_request
    @manager = SNMP::Manager.new(:host => params[:host],
                                 :community => params[:community])
    
    if params[:value].present?
      oid = params[:oid] + ".0"
      binding= SNMP::VarBind.new(oid, SNMP::OctetString.new(params[:value]))
      @manager.set(binding)
    end
    
    if params[:type] == "Object"
      oid = params[:oid] + ".0"
      @response = @manager.get(oid)
    else
      @walked = []
      
      @manager.walk(params[:oid]) do |row|
        @walked << row
      end
    end
    
    puts @walked.inspect
    
    @manager.close
  end
end
