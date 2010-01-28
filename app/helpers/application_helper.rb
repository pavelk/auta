module ApplicationHelper
  
  def page_title 
    title = @page_title ? "#{@page_title} | " : '' 
    %(<title>#{title}Auta nás baví</title>) 
  end
  
  
  def tab_for(name, options = {})
      link_to_unless_current(name, options) do
        content_tag(:span, name)
      end
  end
  
  def main_tab_for(name, options = {})
      link_to_unless_current(name, options) do
        "<strong>#{name}<span></span></strong>"
      end
  end
  
  def use_home_map
    content_for :home_map do
      '<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;hl=cs&amp;key=ABQIAAAACxwsDjo-rcrBV96450KzxxS29vlNIrrAGroOBdtzFAz1u0Eg_BQb5di4rO3sg64dZVR0FocXcYX2mA"
          type="text/javascript"></script>
        <script src="http://www.google.com/uds/api?file=uds.js&v=1.0&key=ABQIAAAACxwsDjo-rcrBV96450KzxxS29vlNIrrAGroOBdtzFAz1u0Eg_BQb5di4rO3sg64dZVR0FocXcYX2mA&hl=cs" type="text/javascript"></script>
        <script src="/javascripts/home.js" type="text/javascript"></script>'        
    end
  end
  
  def use_maps
    content_for :maps do
      '<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;hl=cs&amp;key=ABQIAAAACxwsDjo-rcrBV96450KzxxS29vlNIrrAGroOBdtzFAz1u0Eg_BQb5di4rO3sg64dZVR0FocXcYX2mA"
          type="text/javascript"></script>
        <script src="http://www.google.com/uds/api?file=uds.js&v=1.0&key=ABQIAAAACxwsDjo-rcrBV96450KzxxS29vlNIrrAGroOBdtzFAz1u0Eg_BQb5di4rO3sg64dZVR0FocXcYX2mA&hl=cs" type="text/javascript"></script>              
        <script src="http://www.google.com/uds/solutions/localsearch/gmlocalsearch.js" type="text/javascript"></script>
        <script src="/javascripts/maps.js" type="text/javascript"></script>        
        <style type="text/css">
        	  @import url("http://www.google.com/uds/css/gsearch.css");
        	  @import url("http://www.google.com/uds/solutions/localsearch/gmlocalsearch.css");	  
        </style>'
    end
  end
  
  
  def formatted_date value
    return "#{value.mday}.#{value.mon}.#{value.year}"
  end
  
  def graduation value
    if value
      "Chci maturitu"
    else
      "Chci se vyučit"
    end    
  end
  
  def type_section value
    if value == "graduations"
      "s maturitou"
    elsif value == "no_graduations"
      "bez maturity"
    else
      ""
    end    
  end
  
  def replace_anotation value
     value.gsub!("<i>", "");
     value.gsub!("<b>", "");
     value.gsub!("</i>", "");
     value.gsub!("</b>", "");
     value.gsub!("<strong>", "");
     value.gsub!("</strong>", "");
     value.gsub!("<em>", "");
     value.gsub!("</em>", "");
     return value
  end
  
end
