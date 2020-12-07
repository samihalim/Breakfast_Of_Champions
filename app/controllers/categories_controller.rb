class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_slug(params[:id])
    @pagy, @posts = pagy(@category.posts.order(updated_at: :desc), items: 15)
  end
end
