class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :authenticate_user!, only: %i[ edit update destroy ]
  before_action :authorize_user!, only: %i[ edit update destroy ]
  before_action :destroy_children, only: %i[ destroy ]
  before_action :admin!, only: %i[ admin ]

  # GET /posts or /posts.json
  def index
    @posts = Post.published
    @reservation = Reservation.new
    if params[:category].present?
    @posts = @posts.where(category_id: params[:category])
    end
    if params[:city].present?
      @posts = @posts.where(city_id: params[:city])
    end 
  end

  def my_posts
    @posts = current_user.posts
    @reservation = Reservation.new
  end



  def admin
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @reservation = Reservation.new
  end

  # GET /posts/new
  def new
    @post = Post.new
    @reservation = Reservation.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.published_at = DateTime.now if @post.published_at.blank?
    @post.user = current_user

  
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])
    params = post_params
    @post.images << params[:images]
    #update post with everything except images
    params.delete(:images)
    @post.update(params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def admin!
      unless current_user.admin == true
        redirect_to root_path, notice: "You dont have permissions to do that."
      end
    end

    def destroy_children
      @post.comments.destroy_all
      #@post.reservations.destroy_all
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :adress, :city_id, :body, :category_id, :published_at, :price, images: [])
    end
   
    def show
      @post = Post.find(params[:id])
    end

    def authorize_user!
      unless @post.user == current_user || current_user.admin == true
      redirect_to root_path, notice: "You dont have permissions to do that."
      end
    end
end
