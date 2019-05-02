class Api::V1::AuthorsController < Api::V1::BaseController
  before_action :set_author, only: %i[show update destroy]

  # GET /authors
  def index
    @authors = Author.all
    render json: @authors
  end

  # GET /authors/:id
  def show
    render json: @author
  end

  # POST /authors
  def create
    @author = Author.create!(author_params)
    render json: @author, status: :created
  end

  # DELETE /authors/:id
  def destroy
    @author.destroy
    head :no_content
  end

  # PUT /authors/:id
  def update
    @author.update(author_params)
    head :no_content
  end

  private

  def author_params
    params.require(:author).permit(:name, :email, :birth_date)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
