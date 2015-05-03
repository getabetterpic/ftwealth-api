require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ScheduledTransactionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ScheduledTransaction. As you add validations to ScheduledTransaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScheduledTransactionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all scheduled_transactions as @scheduled_transactions" do
      scheduled_transaction = ScheduledTransaction.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:scheduled_transactions)).to eq([scheduled_transaction])
    end
  end

  describe "GET #show" do
    it "assigns the requested scheduled_transaction as @scheduled_transaction" do
      scheduled_transaction = ScheduledTransaction.create! valid_attributes
      get :show, {:id => scheduled_transaction.to_param}, valid_session
      expect(assigns(:scheduled_transaction)).to eq(scheduled_transaction)
    end
  end

  describe "GET #new" do
    it "assigns a new scheduled_transaction as @scheduled_transaction" do
      get :new, {}, valid_session
      expect(assigns(:scheduled_transaction)).to be_a_new(ScheduledTransaction)
    end
  end

  describe "GET #edit" do
    it "assigns the requested scheduled_transaction as @scheduled_transaction" do
      scheduled_transaction = ScheduledTransaction.create! valid_attributes
      get :edit, {:id => scheduled_transaction.to_param}, valid_session
      expect(assigns(:scheduled_transaction)).to eq(scheduled_transaction)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ScheduledTransaction" do
        expect {
          post :create, {:scheduled_transaction => valid_attributes}, valid_session
        }.to change(ScheduledTransaction, :count).by(1)
      end

      it "assigns a newly created scheduled_transaction as @scheduled_transaction" do
        post :create, {:scheduled_transaction => valid_attributes}, valid_session
        expect(assigns(:scheduled_transaction)).to be_a(ScheduledTransaction)
        expect(assigns(:scheduled_transaction)).to be_persisted
      end

      it "redirects to the created scheduled_transaction" do
        post :create, {:scheduled_transaction => valid_attributes}, valid_session
        expect(response).to redirect_to(ScheduledTransaction.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved scheduled_transaction as @scheduled_transaction" do
        post :create, {:scheduled_transaction => invalid_attributes}, valid_session
        expect(assigns(:scheduled_transaction)).to be_a_new(ScheduledTransaction)
      end

      it "re-renders the 'new' template" do
        post :create, {:scheduled_transaction => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested scheduled_transaction" do
        scheduled_transaction = ScheduledTransaction.create! valid_attributes
        put :update, {:id => scheduled_transaction.to_param, :scheduled_transaction => new_attributes}, valid_session
        scheduled_transaction.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested scheduled_transaction as @scheduled_transaction" do
        scheduled_transaction = ScheduledTransaction.create! valid_attributes
        put :update, {:id => scheduled_transaction.to_param, :scheduled_transaction => valid_attributes}, valid_session
        expect(assigns(:scheduled_transaction)).to eq(scheduled_transaction)
      end

      it "redirects to the scheduled_transaction" do
        scheduled_transaction = ScheduledTransaction.create! valid_attributes
        put :update, {:id => scheduled_transaction.to_param, :scheduled_transaction => valid_attributes}, valid_session
        expect(response).to redirect_to(scheduled_transaction)
      end
    end

    context "with invalid params" do
      it "assigns the scheduled_transaction as @scheduled_transaction" do
        scheduled_transaction = ScheduledTransaction.create! valid_attributes
        put :update, {:id => scheduled_transaction.to_param, :scheduled_transaction => invalid_attributes}, valid_session
        expect(assigns(:scheduled_transaction)).to eq(scheduled_transaction)
      end

      it "re-renders the 'edit' template" do
        scheduled_transaction = ScheduledTransaction.create! valid_attributes
        put :update, {:id => scheduled_transaction.to_param, :scheduled_transaction => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested scheduled_transaction" do
      scheduled_transaction = ScheduledTransaction.create! valid_attributes
      expect {
        delete :destroy, {:id => scheduled_transaction.to_param}, valid_session
      }.to change(ScheduledTransaction, :count).by(-1)
    end

    it "redirects to the scheduled_transactions list" do
      scheduled_transaction = ScheduledTransaction.create! valid_attributes
      delete :destroy, {:id => scheduled_transaction.to_param}, valid_session
      expect(response).to redirect_to(scheduled_transactions_url)
    end
  end

end