ActionController::Routing::Routes.draw do |map|
  
  map.resources :notes
  map.resources :blogs
  map.resources :employers
  map.resources :sections
  map.resources :open_doors
  map.resources :schools
  map.resources :users
  
  map.with_options :controller => 'info' do |info|
    info.vto_1 'bude-vas-to-bavit', :action => 'vto_1'
    info.vto_2 'najdete-uplatneni', :action => 'vto_2'
    info.vto_3 'vydelate-si', :action => 'vto_3'
    info.vto_4 'bude-o-vas-zajem', :action => 'vto_4'
    info.about 'o-sdruzeni-AP', :action => 'about'
    info.map 'interaktivni-mapa', :action => 'map'
    info.faq 'FAQ', :action => 'faq'
    info.accesibility 'prohlaseni-o-pristupnosti', :action => 'accesibility'
    info.contact 'kontakt', :action => 'contact'
    info.download 'ke-stazeni', :action => 'download'
    info.competition 'soutez', :action => 'competition'        
  end
  
  map.resources :hints, :collection => { :specialists => :get, :no_specialists => :get}
  map.with_options :controller => "hints" do |hint|
    hint.specialists_hints "/rady-odborniku/autoprofesionalove/:page", :action => "specialists", :page => nil
    hint.no_specialists_hints "/rady-odborniku/odbornici/:page", :action => "no_specialists", :page => nil  
    hint.hints "/rady-odborniku/:page", :action => "index", :page => nil   
    hint.hint "/rada-odbornika/:id/:page", :action => "show", :page => nil
  end
  
  map.resources :sections, :collection => { :graduations => :get, :no_graduations => :get }
  map.with_options :controller => "sections" do |section|
    section.graduations_sections "/obory/s-maturitou/:page", :action => "graduations", :page => nil
    section.no_graduations_sections "/obory/bez-maturity/:page", :action => "no_graduations", :page => nil  
    section.sections "/obory/:page", :action => "index", :page => nil   
    section.section "/obor/:id/:page", :action => "show", :page => nil
  end

  map.root :controller => "home"
  #map.home '/', :controller => 'home', :action => 'index', :method => :get
  map.home '/', :controller => 'home'
  map.search '/hledani', :controller => 'look', :action => 'index', :method => :get
  
  map.resource  :user_session,
                :as => 'prihlaseni',
                :path_names => { :new => 'nove' }
  
  #map.round '/soutez', :controller => 'rounds', :action
                
  map.admin '/admin', :controller => 'admin/schools', :action => 'index'

  map.namespace :admin do |admin|
    admin.resources :employers 
    admin.resources :schools
    admin.resources :sections
    admin.resources :blogs
    admin.resources :notes
    admin.resources :hints
    admin.resources :rounds
  end              

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
