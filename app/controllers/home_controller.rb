class HomeController < ApplicationController
  def index
    require 'open-uri'

    response = JSON.parse(open('http://stalytics.herokuapp.com/ISteamItems_730/GetItemsList/v1/?page=' + ( params[:page] || 1  ).to_s + '&per_page=99').read)

    if response['data']['current_page'] == response['data']['last_page']
      @next = nil
    else
      @next = response['data']['current_page'].to_i + 1
    end

    @prev = response['data']['current_page'] != 1 ? response['data']['current_page'].to_i - 1 : nil

    @items = response['data']['items']
  end
end
