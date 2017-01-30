ActiveAdmin.register Category do
  permit_params :name
  sortable tree: true,
           sorting_attribute: :ancestry,
           parent_method: :parent,
           children_method: :children,
           roots_method: :roots

  index as: :sortable do
    label :name
    actions
  end

  form do |f|
    f.inputs 'Detail of category' do
      f.input :name
      f.input :ancestry
    end
    f.actions
  end
end
