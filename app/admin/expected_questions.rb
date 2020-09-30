ActiveAdmin.register ExpectedQuestion do
  permit_params :title, :content, :user_id
  
end