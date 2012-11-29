m = SNMP::TrapListener.new(:host => ENV["HOST"], :port => 1062) do |manager|
    manager.on_trap_default do |trap|
      PrivatePub.publish_to "/alerts", "$('#alerts').prepend('New Alert');")
      
      trap.each_varbind do |v| 
        PrivatePub.publish_to "/alerts", "$('#alerts').prepend('OID: #{v.name.to_s} Value: #{v.value.to_s}<br />');")
      end
      
      PrivatePub.publish_to "/alerts", "$('#alerts').prepend('<hr />');")
    end
end
m.join