RolloutAdmin::Engine.routes.draw do
	get "index" => "admin#index"
	get "get_users" => "admin#get_users"
	post "create" => "admin#create"
	post "add" => "admin#add"
	post "remove" => "admin#remove"
	post "update_percentage" => "admin#update_percentage"
	post 'deactivate' => "admin#deactivate"
	post 'activate' => "admin#activate"

	root :to => "admin#index"
end
