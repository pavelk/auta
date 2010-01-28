class OpenDoorsController < FrontendController
  
  #add_crumb ('Dny otevřených dveří')
  add_crumb ('Dny otevřených dveří') { |instance| instance.send :open_doors_path }
  
end
