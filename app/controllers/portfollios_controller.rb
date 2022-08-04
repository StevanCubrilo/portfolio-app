class PortfolliosController < ApplicationController
    def index
        @portfolio_items = Portfollio.all
    end
end
