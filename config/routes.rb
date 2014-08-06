# == Route Map
#
#                   Prefix Verb     URI Pattern                             Controller#Action
#                  hashtag GET      /hashtags/:hashtag(.:format)            hashtags#show
#                 hashtags GET      /hashtags(.:format)                     hashtags#index
#                  sidekiq          /admin/sidekiq/jobs                     Sidekiq::Web
#              rails_admin          /admin                                  RailsAdmin::Engine
#               error_page GET|POST /error(.:format)                        pages#error
#                    terms GET      /terms(.:format)                        pages#terms
#                  privacy GET      /privacy(.:format)                      pages#privacy
#                          GET      /o/:provider/callback(.:format)         users/oauth#create
#                o_failure GET      /o/failure(.:format)                    users/oauth#failure
#            provider_auth GET      /o/:provider(.:format)                  users/oauth#passthru
#                        o GET      /o(.:format)                            redirect(301, /o/login)
#         new_user_session GET      /a/login(.:format)                      users/sessions#new
#             user_session POST     /a/login(.:format)                      users/sessions#create
#     destroy_user_session GET      /a/logout(.:format)                     users/sessions#destroy
#            user_password POST     /a/password(.:format)                   users/passwords#create
#        new_user_password GET      /a/password/new(.:format)               users/passwords#new
#       edit_user_password GET      /a/password/edit(.:format)              users/passwords#edit
#                          PATCH    /a/password(.:format)                   users/passwords#update
#                          PUT      /a/password(.:format)                   users/passwords#update
# cancel_user_registration GET      /a/cancel(.:format)                     users/registrations#cancel
#        user_registration POST     /a(.:format)                            users/registrations#create
#    new_user_registration GET      /a/signup(.:format)                     users/registrations#new
#   edit_user_registration GET      /a/edit(.:format)                       users/registrations#edit
#                          PATCH    /a(.:format)                            users/registrations#update
#                          PUT      /a(.:format)                            users/registrations#update
#                          DELETE   /a(.:format)                            users/registrations#destroy
#        user_confirmation POST     /a/confirmation(.:format)               users/confirmations#create
#    new_user_confirmation GET      /a/confirmation/new(.:format)           users/confirmations#new
#                          GET      /a/confirmation(.:format)               users/confirmations#show
#              user_unlock POST     /a/unlock(.:format)                     users/unlocks#create
#          new_user_unlock GET      /a/unlock/new(.:format)                 users/unlocks#new
#                          GET      /a/unlock(.:format)                     users/unlocks#show
#                user_root GET      /a/after(.:format)                      users/registrations#after_auth
#                        a GET      /a(.:format)                            redirect(301, /a/signup)
#               resources GET      /resources(.:format)                   resources#index
#                          POST     /resources(.:format)                   resources#create
#            new_resource GET      /resources/new(.:format)               resources#new
#           edit_resource GET      /resources/:id/edit(.:format)          resources#edit
#                resource GET      /resources/:id(.:format)               resources#show
#                          PATCH    /resources/:id(.:format)               resources#update
#                          PUT      /resources/:id(.:format)               resources#update
#                          DELETE   /resources/:id(.:format)               resources#destroy
#              attachments GET      /attachments(.:format)                  attachments#index
#                          POST     /attachments(.:format)                  attachments#create
#           new_attachment GET      /attachments/new(.:format)              attachments#new
#          edit_attachment GET      /attachments/:id/edit(.:format)         attachments#edit
#               attachment GET      /attachments/:id(.:format)              attachments#show
#                          PATCH    /attachments/:id(.:format)              attachments#update
#                          PUT      /attachments/:id(.:format)              attachments#update
#                          DELETE   /attachments/:id(.:format)              attachments#destroy
#     user_authentications GET      /u/:user_id/accounts(.:format)          authentications#index
#                          POST     /u/:user_id/accounts(.:format)          authentications#create
#  new_user_authentication GET      /u/:user_id/accounts/new(.:format)      authentications#new
# edit_user_authentication GET      /u/:user_id/accounts/:id/edit(.:format) authentications#edit
#      user_authentication GET      /u/:user_id/accounts/:id(.:format)      authentications#show
#                          PATCH    /u/:user_id/accounts/:id(.:format)      authentications#update
#                          PUT      /u/:user_id/accounts/:id(.:format)      authentications#update
#                          DELETE   /u/:user_id/accounts/:id(.:format)      authentications#destroy
#                     user GET      /u/:id(.:format)                        users#show
#                user_home GET      /home(.:format)                         users#show
#                     test GET      /p/test(.:format)                       pages#test
#                  p_email GET      /p/email(.:format)                      pages#email
#                          GET      /robots.:format                         robots#index
#                     root GET      /                                       pages#home
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
#

# Route prefixes use a single letter to allow for vanity urls of two or more characters
Rails.application.routes.draw do

  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  if defined? Sidekiq
    require 'sidekiq/web'
    authenticate :user, lambda {|u| u.is_admin? } do
      mount Sidekiq::Web, at: '/admin/sidekiq/jobs', as: :sidekiq
    end
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin' if defined? RailsAdmin

  # Static pages
  match '/error' => 'pages#error', via: [:get, :post], as: 'error_page'
  get '/terms' => 'pages#terms', as: 'terms'
  get '/privacy' => 'pages#privacy', as: 'privacy'

  # OAuth
  oauth_prefix = Rails.application.config.auth.omniauth.path_prefix
  get "#{oauth_prefix}/:provider/callback" => 'users/oauth#create'
  get "#{oauth_prefix}/failure" => 'users/oauth#failure'
  get "#{oauth_prefix}/:provider" => 'users/oauth#passthru', as: 'provider_auth'
  get oauth_prefix => redirect("#{oauth_prefix}/login")

  # Devise
  devise_prefix = Rails.application.config.auth.devise.path_prefix
  devise_for :users, path: devise_prefix,
    controllers: {registrations: 'users/registrations', sessions: 'users/sessions',
      passwords: 'users/passwords', confirmations: 'users/confirmations', unlocks: 'users/unlocks'},
    path_names: {sign_up: 'signup', sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do
    get "#{devise_prefix}/after" => 'users/registrations#after_auth', as: 'user_root'
  end
  get devise_prefix => redirect('/a/signup')

  # Resources & Attachments
  resources :resources
  resources :attachments
  # User
  resources :users, path: 'u', only: :show do
    resources :authentications, path: 'accounts'
  end
  get '/home' => 'users#show', as: 'user_home'

  # Dummy preview pages for testing.
  get '/p/test' => 'pages#test', as: 'test'
  get '/p/email' => 'pages#email' if ENV['ALLOW_EMAIL_PREVIEW'].present?

  get 'robots.:format' => 'robots#index'

  root 'pages#home'
end
