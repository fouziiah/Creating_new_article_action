# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def index
    @comments = Comment.where(article_id: params[:article_id])

    render json: @comments
  end

  def create
    # if !user_signed_in?
    #   @comment = Comment.user.create

    @category = Category.find(params[:category_id])
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    redirect_to category_article_path(@category, @article)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:article_id])

    @comment = @article.comments.find(params[:id])
    
    @comment.destroy
    redirect_to category_article_path(@category, @article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
