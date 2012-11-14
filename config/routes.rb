Nms::Application.routes.draw do
  root :to => 'mib_browser#index'
  
  resource :mib_browser, :controller => "mib_browser" do
    collection do
      post :snmp_request
    end
  end
end
