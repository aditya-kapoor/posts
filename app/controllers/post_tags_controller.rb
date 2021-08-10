class PostTagsController < ApplicationController
  before_action :set_post_tag, only: [:show, :edit, :update, :destroy]

  # GET /post_tags
  def index
    @post_tags = PostTag.all
  end

  # GET /post_tags/1
  def show
  end

  # GET /post_tags/new
  def new
    @post_tag = PostTag.new
  end

  # GET /post_tags/1/edit
  def edit
  end

  # POST /post_tags
  def create
    @post_tag = PostTag.new(post_tag_params)

    if @post_tag.save
      redirect_to @post_tag, notice: 'Post tag was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /post_tags/1
  def update
    if @post_tag.update(post_tag_params)
      redirect_to @post_tag, notice: 'Post tag was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /post_tags/1
  def destroy
    @post_tag.destroy
    redirect_to post_tags_url, notice: 'Post tag was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_tag
      @post_tag = PostTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_tag_params
      params.require(:post_tag).permit(:post_id, :tag_id)
    end
end
