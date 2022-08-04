class PortfolliosController < ApplicationController
    def index
        @portfolio_items = Portfollio.all
    end

    def new
        @portfolio_item = Portfollio.new
    end

    def create
        @portfolio_item = Portfollio.new(params.require(:portfollio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
         if @portfolio_item.save
            format.html { redirect_to portfollios_path, notice: "Your portfolio item is now live." }
            
         else
            format.html { render :new, status: :unprocessable_entity }
            
         end
        end
    end


end

