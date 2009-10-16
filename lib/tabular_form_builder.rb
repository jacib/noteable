class TabularFormBuilder < ActionView::Helpers::FormBuilder

  
  def field_settings(method, options = {}, tag_value = nil)
    field_name = "#{@object_name}_#{method.to_s}"
    default_label = tag_value.nil? ? "#{method.to_s.humanize.gsub(/\_/, " ")}" : "#{tag_value.to_s.gsub(/\_/, " ")}"
    label = options[:label] ? options.delete(:label) : default_label
    options[:class] ||= ""
    options[:class] += options[:required] ? " required" : ""
    [field_name, label, options]
  end

  def text_field(method, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("text", field_name, label, super, options)
  end

  def file_field(method, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("file", field_name, label, super, options)
  end

  def datetime_select(method, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("datetime", field_name, label, super, options)
  end

  def date_select(method, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("date", field_name, label, super, options)
  end

  def radio_button(method, tag_value, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("radio", field_name, label, super, options)
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    field_name, label, options = field_settings(method, options)
    wrapping("check-box", field_name, label, super, options)
  end

  def select(method, choices, options = {}, html_options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("select", field_name, label, super, options)
  end

  def time_zone_select(method, choices, options = {}, html_options = {})
    field_name, label, options = field_settings(method, options)
    # wrapping("time-zone-select", field_name, label, super, options)
    select_box = this_check_box = @template.select(@object_name, method, choices, options.merge(:object => @object), html_options)
    wrapping("time-zone-select", field_name, label, select_box, options)    
  end

  def password_field(method, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("password", field_name, label, super, options)
  end

  def text_area(method, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("textarea", field_name, label, super, options)
  end

  def submit(method, options = {})
    field_name, label, options = field_settings(method, options.merge( :label => "&nbsp;"))
    result = []
    result << divider
    result << wrapping("submit", field_name, label, super, options)
    return result
  end

  def submit_and_cancel(submit_name, cancel_name, options = {})
    submit_button = @template.submit_tag(submit_name, options)
    cancel_button = @template.submit_tag(cancel_name, options)
    result = []
    result << divider
    result << wrapping("submit", nil, "", submit_button+cancel_button, options)
    result
  end

  def recaptcha(tags)
    @template.content_tag("tr",
      @template.content_tag("td") + 
        @template.content_tag("td", tags))
  end

  private 

    def wrapping(type, field_name, label, field, options = {})
      required = options[:required] ? "<br/><small>(Required)</small>" : ""
      @template.content_tag("tr", 
        @template.content_tag("td", label.concat(required) +
          @template.content_tag("td", field), :class => "label"))
    end
    
    def divider
      @template.content_tag("tr", 
        @template.content_tag("td", "" + 
          @template.content_tag("td", "" +
            @template.content_tag("div", "", :class => "divider"))))
    end

end