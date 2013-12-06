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
    script = <<-EOF
    $(function() {
      var year = $("##{@object_name}_#{method}_1i")
      var month = $("##{@object_name}_#{method}_2i")
      var date = $("##{@object_name}_#{method}_3i")
      $("input.datepicker").datepicker()
        .on("changeDate", function(e) {

        })
    })
    EOF
    @template.text_field(@object_name, method, {:class => "datepicker", :type => "text"})
  end

  def submit(*args)
    options = args.extract_options!
    options[:class] ||= "btn btn-primary"
    args << options
    super(*args)
  end
end


# <div class="btn-group">
#   <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
#     Action <span class="caret"></span>
#   </button>
#   <ul class="dropdown-menu" role="menu">
#     <li><a href="#">Action</a></li>
#     <li><a href="#">Another action</a></li>
#     <li><a href="#">Something else here</a></li>
#     <li class="divider"></li>
#     <li><a href="#">Separated link</a></li>
#   </ul>
# </div>