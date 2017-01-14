module ApplicationHelper
  def nested_category(categories)
    categories.map do |category, sub_category|
      render(category) + content_tag(:div, nested_category(sub_category), id: "nested_for_#{category.id}", class: 'nested_categories list-group-item')
    end.join.html_safe
  end
end
