module ApplicationHelper

  def logo
    link_to root_path, class:"logo pull-left" do
      image_tag('http://www.honeycando.com/images/hcd_logo.gif')
    end   
  end
  
end
