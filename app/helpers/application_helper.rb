module ApplicationHelper

  def icon_for(name)
    "<i class='icon-#{name}'></i>".html_safe
  end

  def ribbon_for(name)
    "<i class='ribbon-#{name}'></i>".html_safe
  end

end
