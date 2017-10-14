RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :backoffice_administrator
  end
  config.current_user_method(&:current_backoffice_administrator)
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.main_app_name = ["WTrainings", "BackOffice"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    ActiveRecord::Base.descendants.each do |imodel|
      config.model "#{imodel.name}" do
        list do
          exclude_fields :created_at, :updated_at
        end
      end
    end

    #### TRAINING CONFIGURATION ####
    config.model 'Training' do
      create do
        exclude_fields :training_users
      end
      edit do
        exclude_fields :training_users
      end
    end

    #### TRAINING SESSION CONFIGURATION ####
    config.model 'TrainingSession' do
      parent Training
    end

    #### TRAINER CONFIGURATION ####
    config.model 'TrainingUser' do
      parent Training
      label 'Trainer'
    end

    #### INVITATION CONFIGURATION ####
    config.model 'Invitation' do
      parent Training
      nested do
        exclude_fields :attended, :status
      end
    end

    #### USER CONFIGURATION ####
    config.model 'User' do
      create do
        exclude_fields :created_at, :updated_at, :invitations, :training_users, :trainings
      end
    end
  end
end
