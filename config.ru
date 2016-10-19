require_relative 'config/environment'


use UsersController
use RestaurantsController
use Rack::MethodOverride
run ApplicationController
