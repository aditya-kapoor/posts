class PostTagsController < ApplicationController
  before_action :set_post_tag, only: %i[show edit update destroy]

  def index
    @q = PostTag.ransack(params[:q])
    @post_tags = @q.result(distinct: true).includes(:post,
                                                    :tag).page(params[:page]).per(10)
  end

  def show; end

  def new
    @post_tag = PostTag.new
  end

  def edit; end

  def create
    @post_tag = PostTag.new(post_tag_params)

    if @post_tag.save
      message = "PostTag was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @post_tag, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @post_tag.update(post_tag_params)
      redirect_to @post_tag, notice: "Post tag was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post_tag.destroy
    message = "PostTag was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to post_tags_url, notice: message
    end
  end

  private

  def set_post_tag
    @post_tag = PostTag.find(params[:id])
  end

  def post_tag_params
    params.require(:post_tag).permit(:post_id, :tag_id)
  end
end
