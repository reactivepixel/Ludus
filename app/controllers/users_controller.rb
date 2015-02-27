require 'rubygems'
require 'json'
require 'net/http'
require 'httparty'

class UsersController < ApplicationController
	include HTTParty

	respond_to :json
	def index
    @users = User.all

	end
	def show
    @user = User.find(params[:id])
	    if @user.repo_name.present?
	    url = 'https://api.github.com/users/' + @user.repo_name + '/repos'
	    reponse = HTTParty.get(url)
	    @json = JSON.parse(reponse.body)
	    
	else
		end
	end
end
