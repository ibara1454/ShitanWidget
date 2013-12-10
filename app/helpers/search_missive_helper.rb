module SearchMissiveHelper
  def dropdown_button(name = "", options = {})
    list = options[:list] || []

    btn = button_tag(:class => "btn dropdown-toggle", :data => {:toggle => "dropdown"}) do
      name.concat(content_tag(:span, "", :class => "caret")).html_safe
    end
    ul = content_tag(:ul, :class => "dropdown-menu") do
      list.collect { |action|
        li_a(action)
      }.join().html_safe
    end
    content_tag(:div, btn.concat(ul), :class => "btn-group")
  end

  private
  def li_a(action)
    content_tag(:li) do
      content_tag(:a, action)
    end
  end
end

class BootstrapFormBulder < ActionView::Helpers::FormBuilder
  def datepicker(method, options = {}, html_options = {})
    @template.text_field(@object_name, method, {:class => "datepicker", :type => "text", :placeholder => "yyyy-mm-dd"})
  end

  def submit(*args)
    options = args.extract_options!
    options[:class] ||= "btn btn-primary"
    args << options
    super(*args)
  end
end