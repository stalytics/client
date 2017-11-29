Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'home#index'

    # get '/graph/:market_hash_name', to: 'graph#index'
  end
end
