require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    let(:questions) { create_list(:event, 3) }

    before { get :index }

    it 'init array of all events' do
      expect(assigns(:events)).to match_array(questions)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end
end
