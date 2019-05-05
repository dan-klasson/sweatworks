require 'rails_helper'

RSpec.describe 'Publication API', type: :request do
  context 'GET #index' do
    let(:author) { create :author }
    before(:each) do
      create_list(:publication, 5, author: author)
    end

    it 'returns http success' do
      get "/api/v1/authors/#{author.id}/publications"
      expect(response).to have_http_status(:success)
    end

    it 'contains expected publication list' do
      get "/api/v1/authors/#{author.id}/publications?sort=published_at"
      expect(json.length).to be(5)

      first = json.first
      expect(first['title']).to match('Title 1')
      expect(first['body']).to match('Body 1')
      expect(first['published_at']).to match('2019-01-01T20:00:00.000Z')

      last = json.last
      expect(last['title']).to match('Title 5')
      expect(last['body']).to match('Body 5')
      expect(last['published_at']).to match('2019-01-05T20:00:00.000Z')
    end

    it 'orders publication list' do
      get "/api/v1/authors/#{author.id}/publications?sort=-published_at"

      first = json.first
      expect(first['title']).to match('Title 5')
      expect(first['body']).to match('Body 5')
      expect(first['published_at']).to match('2019-01-05T20:00:00.000Z')

      last = json.last
      expect(last['title']).to match('Title 1')
      expect(last['body']).to match('Body 1')
      expect(last['published_at']).to match('2019-01-01T20:00:00.000Z')
    end
  end

  context 'GET #search' do
    before(:each) do
      create_list(:publication, 5)
    end

    it 'searches for title' do
      expect(Publication.count).to be(5)

      get '/api/v1/publications/search', params: { q: 'Title 1' }
      expect(json.length).to be(1)
    end

    it 'searches and finds all' do
      get '/api/v1/publications/search', params: { q: 'Title' }
      expect(json.length).to be(5)
    end

    it 'searches with empty query' do
      get '/api/v1/publications/search', params: { q: '' }
      expect(json.length).to be(5)
    end

    it 'searches without params' do
      get '/api/v1/publications/search'
      expect(json.length).to be(5)
    end
  end

  context 'GET #show' do
    let(:publication) { create :publication }

    it 'shows the publication' do
      get "/api/v1/publications/#{publication.id}"

      expect(json['title']).to match('Title 1')
      expect(json['body']).to match('Body 1')
      expect(json['published_at']).to match('2019-01-01T20:00:00.000Z')
    end
  end

  context 'POST #create' do
    let(:author) { create :author }
    let(:valid_attributes) do
      {
        author_id: author.id,
        title: 'Some Publication',
        body: 'Some Body',
        published_at: '1984-01-01 10:00',
      }
    end

    it 'creates new publication' do
      expect(Publication.count).to be(0)
      post '/api/v1/publications', params: { publication: valid_attributes }

      expect(Publication.count).to be(1)
      publication = Publication.first
      expect(publication.title).to match('Some Publication')
      expect(publication.body).to match('Some Body')
      expect(publication.published_at).to match(DateTime.new(1984, 1, 1, 10, 0))
    end
  end

  context 'PUT #update' do
    let(:author) { create :author }
    let(:publication) { create :publication, author: author }
    let(:valid_attributes) do
      {
        author_id: author.id,
        title: 'Updated Publication',
        body: 'Updated Body',
        published_at: '1984-01-02 20:00',
        time: '10:05'
      }
    end

    it 'updates publication' do
      expect(publication.title).to match('Title 1')
      expect(publication.body).to match('Body 1')
      expect(publication.published_at).to match(DateTime.new(2019, 1, 1, 20, 0))

      params = { publication: valid_attributes }
      put "/api/v1/publications/#{publication.id}", params: params

      publication = Publication.first
      expect(publication.title).to match('Updated Publication')
      expect(publication.body).to match('Updated Body')
      expect(publication.published_at).to match(DateTime.new(1984, 1, 2, 20, 0))
    end
  end

  context 'DELETE #destroy' do
    before(:each) { create :publication }

    it 'destroys publication' do
      expect(Publication.count).to be(1)

      delete "/api/v1/publications/#{Publication.first.id}"

      expect(Publication.count).to be(0)
    end
  end
end
