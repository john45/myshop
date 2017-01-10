ActiveAdmin.register Review do
  permit_params :author, :body, :rating, :email, :published
  scope :list_of_published_only
  scope :not_published
end
