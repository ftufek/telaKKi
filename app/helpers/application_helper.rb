module ApplicationHelper

  def icon_for(name)
    "<i class='icon-#{name}'></i>".html_safe
  end

  def ribbon_for(name)
    "<i class='icon-ribbon-#{name}'></i>".html_safe
  end

  def translation_for(key)
    I18n.translate key
  end

  def t_for(key)
    translation_for(key)
  end

  def resource_name
    :user
  end

  def resource
    @resource = current_user || User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
