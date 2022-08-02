RailsAdmin.config do |config|
  require Rails.root.join('lib', 'rails_admin', 'googlemapsadmin.rb')
  require Rails.root.join('lib', 'rails_admin', 'amazon.rb')

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  #RAILS CHART
  # config.actions do
  #   all # NB: comment out this line for RailsAdmin < 0.6.0
  #   charts
  # end

  config.actions do

    all
    # dashboard                     # mandatory
    # index                         # mandatory
    # new
    # create
    # export
    # bulk_delete
    # show
    # edit
    # delete
    # show_in_app
    googlemapsadmin
    amazon

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
