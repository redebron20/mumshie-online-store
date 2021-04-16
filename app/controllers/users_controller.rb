class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
end
