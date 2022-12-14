class PortfolliosController < ApplicationController
    layout 'portfollio'
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
    def index
        @portfolio_items = Portfollio.all
    end

    def angular
        @angular_portfolio_items = Portfollio.angular
    end

    def new
        @portfolio_item = Portfollio.new
        3.times { @portfolio_item.technologies.build }
    end

    def create
        @portfolio_item = Portfollio.new(portfolio_params)
    
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
          if @portfolio_item.update(portfolio_params)
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

    private

    def portfolio_params
        params.require(:portfollio).permit(:title, 
                                           :subtitle,
                                           :body,
                                            technologies_attributes: [:name])
    end


end


