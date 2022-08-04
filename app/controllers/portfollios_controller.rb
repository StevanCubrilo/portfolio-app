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

    def edit
        @portfolio_item = Portfollio.find(params[:id])
    end

    def update
        @portfolio_item = Portfollio.find(params[:id])

        respond_to do |format|
          if @portfolio_item.update(params.require(:portfollio).permit(:title, :subtitle, :body))
            format.html { redirect_to portfollios_path, notice: "The record was successfully updated." }
            
          else
            format.html { render :edit, status: :unprocessable_entity }
            
          end
        end   
    end

    def show
        
        @portfolio_item = Portfollio.find(params[:id])
    end

    def destroy
        # Perform the lookup
        @portfolio_item = Portfollio.find(params[:id])

        # Destroy/delete the record
        @portfolio_item.destroy

        # Redirect
        respond_to do |format|
            format.html { redirect_to portfollios_url, notice: "Record was removed." }
            
        end

    end


end

