require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) { create(:event) }

  describe 'GET #index' do
    let(:events) { create_list(:event, 3) }

    before { get :index }

    it 'init array of all events' do
      expect(assigns(:events)).to match_array(events)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: event } }

    it 'assigns the requested event to @event' do
      expect(assigns(:event)).to eq event
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigned a new Event to @event' do
      expect(assigns(:event)).to be_a_new(Event)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: event } }

    it 'assigns the requested event to @event' do
      expect(assigns(:event)).to eq event
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create'do
    context 'with valid attributes' do
      it 'saves a new event in the database' do
        expect { post :create, params: { event: attributes_for(:event) } }.to change(Event, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { event: attributes_for(:event) }
        expect(response).to redirect_to assigns(:event)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the event' do
        expect { post :create, params: { event: attributes_for(:event, :invalid) } }.to_not change(Event, :count)
      end

      it 're-renders new view' do
        post :create, params: { event: attributes_for(:event, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns the requested event to @event' do
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(assigns(:event)).to eq event
      end

      it 'changes event attributes' do
        patch :update, params: { id: event, event: { title: 'new title', description: 'new description' } }
        event.reload
        expect(event.title).to eq 'new title'
        expect(event.description).to eq 'new description'
      end

      it 'redirects to updated event' do
        patch :update, params: { id: event, event: { title: 'new title', description: 'new description' } }
        expect(response).to redirect_to event
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: event, event: attributes_for(:event, :invalid) } }

      it 'does not change event' do
        event.reload
        expect(event.title).to eq 'MyString'
        expect(event.description).to eq 'MyText'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end

    context 'DELETE #destroy'do
      let!(:event) { create(:event) }

      it 'delete the event' do
        expect { delete :destroy, params: { id: event } }.to change(Event, :count).by(-1)
      end

      it 'redirect to index' do
        delete :destroy, params: { id: event }
        expect(response).to redirect_to events_path
      end
    end
  end
end
