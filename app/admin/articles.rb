ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :avatars =>[]
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # debugger

  filter :title
  filter :body

  index do
    selectable_column
    id_column
    column :title
    column :body
    column  "falana", :created_at do |article|
      article.created_at.to_date
    end
    actions
  end

  show do |account|
    attributes_table do
      row :title 
      # row :body do
      #   account.body.present?
      # end
      row :body
      row "dimaka", :created_at do 
        account.created_at
      end
      row :avatar do
        div do
          account.avatars.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
          end
        end
      end
      row :updated_at
    end
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :avatars, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
  
end
