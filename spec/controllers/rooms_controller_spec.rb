require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:room) { create(:room) }

  describe 'GET #index' do
    let(:rooms) { create_list(:room, 3) }

    before { get :index }

    it 'init array of all rooms' do
      expect(assigns(:rooms)).to match_array(rooms)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: room } }

    it 'assigns the requested room to @room' do
      expect(assigns(:room)).to eq room
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigned a new Room to @room' do
      expect(assigns(:room)).to be_a_new Room
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: room } }

    it 'assigns the requested room to @room' do
      expect(assigns(:room)).to eq room
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new room in the database' do
        expect { post :create, params: { room: attributes_for(:room) } }.to change(Room, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { room: attributes_for(:room) }
        expect(response).to redirect_to assigns(:room)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the room' do
        expect { post :create, params: { room: attributes_for(:room, :invalid) } }.to_not change(Room, :count)
      end

      it 're-renders new view' do
        post :create, params: { room: attributes_for(:room, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      before { patch :update, params: { id: room, room: { title: 'new title' } } }

      it 'assigns the requested room to @room' do
        expect(assigns(:room)).to eq room
      end

      it 'changes room attributes' do
        room.reload
        expect(room.title).to eq 'new title'
      end

      it 'redirects to updated room' do
        expect(response).to redirect_to room
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: room, room: attributes_for(:room, :invalid) } }

      it 'does not change room' do
        room.reload
        expect(room.title).to eq 'MyString'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end

    context 'DELETE #destroy' do
      let!(:room) { create(:room) }

      it 'delete the room' do
        expect { delete :destroy, params: { id: room } }.to change(Room, :count).by(-1)
      end

      it 'redirect to index' do
        delete :destroy, params: { id: room }
        expect(response).to redirect_to rooms_path
      end
    end
  end
end
