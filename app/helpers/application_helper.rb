module ApplicationHelper
  
  def bureau_nav_item
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: etudiants_path,
        title: "Dashboard"
      },
      {
        url: new_etudiant_path,
        title: "M'enregistrer"
      },
      {
        url: root_path() + "etudiants/mazone",
        title: "Ma Zone"
      },
      
    ]
  end
    
  def bureau_nav_helper style, tag_type
    nav_links = ''

    bureau_nav_item.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end
#*******************************************************************#
#************************ END BUREAU'S LOGIN ***************************#
#*******************************************************************#

#*******************************************************************#
#********************** STARTING USER LOGIN ************************#
#*******************************************************************#

    

  def user_nav_item
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: etudiants_path,
        title: "Dashboard"
      },
      {
        url: new_etudiant_path,
        title: "M'enregistrer"
      },
      
    ]
  end
      
  def user_nav_helper style, tag_type
    nav_links = ''

    user_nav_item.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end
#*******************************************************************#
#************************ GENERAL METHOD ***************************#
#*******************************************************************#
  def copyright_generator
    @copyright = ZicrouViewTool::Renderer.copyright 'SK8Z-¯-CLBK', 'All rights reserved'
    #DevcampViewTool::Renderer.copyright 'Zicrou SECK', 'All rights reserved'
  end
  def active? path
    "active" if current_page? path
  end
  
  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "CLINIQUE KHADIJA...", sticky: false, time: 5000)
  end
end
