class ContentsController < ApplicationController
  def index
    contents = Content.published
    jsonapi_render json: contents if stale? contents
  end

  def show
    content = Content.find(params[:id])
    jsonapi_render json: content if stale? content
  end
end

