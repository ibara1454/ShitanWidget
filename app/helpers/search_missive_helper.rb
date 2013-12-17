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
  def datepicker(method, options = {})
    classes = options[:class] ? options[:class].split(" ") : []
    classes << "datepicker" unless classes.index("datepicker")
    options[:class] = classes.join(' ')
    options[:type] = "text"
    options[:placeholder] = "yyyy-mm-dd"
    @template.text_field(@object_name, method, options)
  end

  def submit(*args)
    options = args.extract_options!
    options[:class] ||= "btn btn-primary"
    args << options
    super(*args)
  end
end