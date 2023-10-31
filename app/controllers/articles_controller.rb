class ArticlesController < ApplicationController
  def index
    @article = Article.all 
    # render json:@article, status: :ok 
    render json: {article: ActiveModelSerializers::SerializableResource.new(@article, each_serializer: ArticleSerializer, scope: {host:  request.base_url})}, status: :ok
    # render json: @article, root: 'data', each_serializer: Article::ShowSerializer
  end

  def show
    @article = Article.find_by(id: params[:id]) 
    if @article.present? 
      render json: {article: ActiveModelSerializers::SerializableResource.new(@article, each_serializer: ArticleSerializer, scope: {host:  request.base_url})}, status: :ok
    else 
      render json: {error:"Article not found "}, status: :unprocessable_entity
    end
  end

  def create      
    @article = Article.new(article_params)
    if @article.save 
      render json: {article: ActiveModelSerializers::SerializableResource.new(@article, each_serializer: ArticleSerializer, scope: {host:  request.base_url})}, status: :ok
    else
      render json:{error: @article.errors.full_messages}, status: :unprocessable_entity 
    end

  end

  def update
  end

  def delete
  end
  def article_params
    params.require(:article).permit(:title,:body,:avatar)
  end

end
