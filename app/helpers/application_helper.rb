# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def page_title
    @page_title || action_name.to_s.humanize
  end
  
  def tabular_form_for(name, object = nil, options = nil, &proc)
    concat("<table class=\"tabular_form\">", @_binding)
    form_for(name, object, (options||{}).merge(:builder => TabularFormBuilder), &proc)
    concat("</table>", @_binding)
  end
  
end
