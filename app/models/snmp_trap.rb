class SNMPTrap
  def self.start_listener
    m = SNMP::TrapListener.new(:host => ENV["HOST"], :port => 1062) do |manager|
      manager.on_trap_default do |trap|
        time = Time.now.to_i
        
        buffer = "<div class=\"flash_info\" style=\"display:none\">"
      
        trap.each_varbind do |v| 
          buffer += "OID: #{v.name.to_s} Value: #{v.value.to_s}<br />"
        end
        buffer += "<span style=\"font-size:10px;font-weight:bold;float:right;\"><a href=\"#\" onclick=\"$(this).parent().parent().slideUp();\"> Hide Notification</a></span>"
        buffer += "</div>"
        
        PrivatePub.publish_to("/alerts", "$('#alerts').prepend('#{buffer}');$('#alerts').children().first().slideDown();")
      end
    end
    
    m.join
  end
end