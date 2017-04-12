class PostsController < ApiController
  before_action :require_login, only: [:create, :edit, :destroy]
  before_action :set_post, only: [:show, :edit, :destroy]

  # This is protected by API token
  def index
    render json: { posts: Post.all }
  end

  def show
    render json: { post: @post }
  end

  def create
    post_params
    @post = Post.new(post_params)

    if @post.save
      render json: { message: "Post created!"}
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def edit
    if @post.update(post_params)
      render json: { message: "Post was successfully updated." }
    else
      render json: @post.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @post.destroy
    render json: { message: "Post destroyed!" }
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :categories, :content, :user, :user_id, :id, :post, :props, :headers, :params, :key)
  end
end