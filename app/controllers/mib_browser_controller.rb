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
      @snmp_response = @manager.get(oid)
    else
      @snmp_response = []
      
      oids_to_walk = params[:oid].split(",")
      
      @buffer = "<table>"
      @buffer += "<tr>" + oids_to_walk.collect { |o| '<th>' + o + '</th>'}.join('') + "</tr>"
      @manager.walk(oids_to_walk) { |row| @buffer += "<tr>#{row.collect { |r| '<td>' + r.value.to_s + '</td>'}.join('')}</tr>" }
      @buffer += "</table>"
    end
    
  rescue SNMP::RequestTimeout
    render :js => '$("#results").prepend("<h2>Results</h2> ' + params[:host] + ' - ' + params[:oid] + ' - Request timed out.");
    $("#spinner").fadeOut();'
  ensure
    @manager.close
  end
end
