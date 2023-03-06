Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get("/", { :controller => "dashboard", :action => "home"})
get("/forex", { :controller => "dashboard", :action => "forex"})
get("/covid", { :controller => "dashboard", :action => "covid"})
get("/forex/:from", { :controller => "dashboard", :action => "step_one"})
get("/forex/:from/:to", { :controller => "dashboard", :action => "step_two"})

end
