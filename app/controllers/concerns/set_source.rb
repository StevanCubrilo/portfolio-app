module SetSource
    extend ActiveSupport::Concern

    included do
        #set_source nema veze sa nekom posebnom metodom, nego je ime koje mi sami odredjujemo 
        before_action :set_source
    end

    def set_source
        #I want you to set the session and set on something called source and set it equal to whatever params are
        #and after we done that we would have acces to them on page, where we want
        session[:source] = params[:q] if params[:q]
    end

end

