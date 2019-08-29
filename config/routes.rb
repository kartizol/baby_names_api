Rails.application.routes.draw do
  api vendor_string: 'babynames', default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :name_lists, only: [:show, :create], param: :code do
          resources :names, only: [:index, :update, :create]
        end
      end
    end
  end
end
