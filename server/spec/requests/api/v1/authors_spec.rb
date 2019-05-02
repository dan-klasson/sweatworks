require 'rails_helper'

RSpec.describe 'Author API', type: :request do
  context 'GET #index' do
    before(:each) do
      create_list(:author, 5)
      get '/api/v1/authors'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'contains expected author list' do
      expect(json.length).to match(5)

      first = json.first
      expect(first.keys).to match_array(
        %w[id name email birth_date created_at updated_at]
      )
      expect(first['name']).to match('Daniel Klasson 1')
      expect(first['email']).to match('dan1@example.com')
      expect(first['birth_date']).to match('1979-06-22')

      last = json.last
      expect(last['name']).to match('Daniel Klasson 5')
      expect(last['email']).to match('dan5@example.com')
      expect(last['birth_date']).to match('1979-06-22')
    end
  end

  context 'GET #show' do
    let(:author) { create :author }

    it 'shows the author' do
      get "/api/v1/authors/#{author.id}"

      expect(json['name']).to match('Daniel Klasson 1')
      expect(json['email']).to match('dan1@example.com')
      expect(json['birth_date']).to match('1979-06-22')
    end
  end

  context 'POST #create' do
    let(:valid_attributes) do
      { name: 'John Doe', email: 'john@example.com', birth_date: '1984-01-01' }
    end

    it 'creates new author' do
      expect(Author.count).to be(0)
      post '/api/v1/authors', params: { author: valid_attributes }

      expect(Author.count).to be(1)
      author = Author.first
      expect(author.name).to match('John Doe')
      expect(author.email).to match('john@example.com')
      expect(author.birth_date).to match(Date.new(1984, 1, 1))
    end
  end

  context 'PUT #update' do
    before(:each) do
      create :author
    end

    let(:valid_attributes) do
      { name: 'John Doe', email: 'john@example.com', birth_date: '1984-01-01' }
    end

    it 'updates author' do
      author = Author.first
      expect(author.name).to match('Daniel Klasson 1')
      expect(author.email).to match('dan1@example.com')
      expect(author.birth_date).to match(Date.new(1979, 6, 22))

      put "/api/v1/authors/#{author.id}", params: { author: valid_attributes }

      author = Author.first
      expect(author.name).to match('John Doe')
      expect(author.email).to match('john@example.com')
      expect(author.birth_date).to match(Date.new(1984, 1, 1))
    end
  end

  context 'DELETE #destroy' do
    before(:each) { create :author }

    it 'destroys author' do
      expect(Author.count).to be(1)

      delete "/api/v1/authors/#{Author.first.id}"

      expect(Author.count).to be(0)
    end
  end
end
