ActiveAdmin.register Document do
  permit_params :title, :content, :user_id
  
end
