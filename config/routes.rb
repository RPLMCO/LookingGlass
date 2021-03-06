Rails.application.routes.draw do
  get 'search', to: 'search#index'
  get 'attachments/*path', to: 'docs#attach'
  post 'edit_document', to: 'docs#edit_document'
  delete 'delete_documents', to: 'docs#delete_documents'

  get 'catalyst', to: 'catalyst#index'
  get 'catalyst/basic', to: 'catalyst#basic'
  get 'catalyst/advanced', to: 'catalyst#advanced'
  get 'entities', to: 'entities#index'
  get 'entities_create/*entity', to: 'entities#create'
  post 'entities/save', to: 'entities#save'
  post 'edit_document', to: 'docs#edit_document'

  get 'description', to: 'pages#description'
  get 'free_press_legal_description', to: 'pages#free_press_legal_description'
  get 'advancedsearch', to: 'pages#advanced'
  get 'document_suggest', to: 'pages#document_suggest'
  get 'document_sent', to: 'pages#document_sent'
  get 'datapolitics_description', to: 'pages#datapolitics_description'
  get 'datapolitics_suggest', to: 'pages#datapolitics_suggest'

  get 'api/annotators', to: 'api#annotators'
  post 'api/recipe_search', to: 'api#recipe_search'
  post 'api/create_job', to: 'api#create_job'
  get 'api/facets', to: 'api#facets'
  get 'api/rerun_job', to: 'api#rerun_job'
  
  get 'thumbnail', to: Dragonfly.app.endpoint { |params, app|
    app.fetch_file("#{params[:file]}").thumb(params[:size])
  }
  
  root to: 'docs#index'
  resources :docs

  # Aliases for legacy support
  get 'nsadocs', to: 'docs#index'
  get 'nsadocs/:id', to: 'docs#show'
end
