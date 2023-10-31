ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :article_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :article_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # show do |account|
  #   attributes_table do
  #     row :name 
  #     row :article_id do
  #       account.article_id 
  #     end 
  #     row "dimaka", :created_at do 
  #       account.created_at
  #     end
  #     row :updated_at
  #   end
  # end
  index do
    selectable_column
    id_column
    column :name 
    # column :article_id 
    column :article_id do |article| 
      article.article.title
    end   
    column  "common created at ", :created_at do |article|
      article.created_at.to_date
    end
    actions
  end
  
end
