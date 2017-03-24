Rails.application.routes.draw do
  get 'drivers/index'

  get 'drivers/show'

  get 'drivers/new'

  get 'drivers/create'

  get 'drivers/edit'

  get 'drivers/update'

  get 'drivers/delete'

  get 'passengers/index'

  get 'passengers/show'

  get 'passengers/new'

  get 'passengers/create'

  get 'passengers/edit'

  get 'passengers/update'

  get 'passengers/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
