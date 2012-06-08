ActiveAdmin.register Category do
  form do |f|
    f.inputs do
      f.input :parent
      f.input :name
      f.input :icon_name
    end
    f.buttons
  end
end
