class Api::V1::PublicationsController < Api::V1::BaseController
  include Orderable
  before_action :set_publication, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  # GET /authors/:author_id/publications
  def index
    @publications = Publication
      .paginate(page: params[:page])
      .order(ordering_params(params))
      .joins(:author)
    if params[:author_id]
      @publications = @publications.where(author: params[:author_id])
    end
    render json: paginate(@publications)
  end

  # GET /publications/search
  def search
    @publications = Publication
      .paginate(page: params[:page])
      .search(params[:q])
    render json: paginate(@publications)
  end

  # GET /publications/:id
  def show
    render json: @publication
  end

  # POST /publications
  def create
    @publication = Publication.create!(publication_params)
    render json: @publication, status: :created
  end

  # DELETE /publications/:id
  def destroy
    @publication.destroy
    head :no_content
  end

  # PUT /publications/:id
  def update
    @publication.update(publication_params)
    head :no_content
  end

  private

  def publication_params
    params.require(:publication).permit(:author_id, :title, :body, :published_at)
  end

  def set_publication
    @publication = Publication.find(params[:id])
  end
end
