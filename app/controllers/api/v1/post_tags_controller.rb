class Api::V1::PostTagsController < Api::V1::GraphitiController
  def index
    post_tags = PostTagResource.all(params)
    respond_with(post_tags)
  end

  def show
    post_tag = PostTagResource.find(params)
    respond_with(post_tag)
  end

  def create
    post_tag = PostTagResource.build(params)

    if post_tag.save
      render jsonapi: post_tag, status: :created
    else
      render jsonapi_errors: post_tag
    end
  end

  def update
    post_tag = PostTagResource.find(params)

    if post_tag.update_attributes
      render jsonapi: post_tag
    else
      render jsonapi_errors: post_tag
    end
  end

  def destroy
    post_tag = PostTagResource.find(params)

    if post_tag.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: post_tag
    end
  end
end
