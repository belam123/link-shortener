class LinksController < ApplicationController
    def show 
      @link = Link.find_by_slug(params[:slug])
      render 'errors/404', status: 404 if @link.nil?
      @link.update_attribute(:clicked, @link.clicked + 1) 
      redirect_to @link.url, allow_other_host: true
    end
  
    def create
      @link = Link.new(link_params)
  
      if @link.save
        render json: { short_url: @link.short }, status: :created
      else
        render json: @link.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def link_params
      params.require(:link).permit(:url, :slug)
    end
  end
  