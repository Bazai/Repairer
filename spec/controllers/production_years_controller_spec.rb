require 'spec_helper'

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

describe ProductionYearsController do

  # This should return the minimal set of attributes required to create a valid
  # ProductionYear. As you add validations to ProductionYear, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all production_years as @production_years" do
      production_year = ProductionYear.create! valid_attributes
      get :index
      assigns(:production_years).should eq([production_year])
    end
  end

  describe "GET show" do
    it "assigns the requested production_year as @production_year" do
      production_year = ProductionYear.create! valid_attributes
      get :show, :id => production_year.id.to_s
      assigns(:production_year).should eq(production_year)
    end
  end

  describe "GET new" do
    it "assigns a new production_year as @production_year" do
      get :new
      assigns(:production_year).should be_a_new(ProductionYear)
    end
  end

  describe "GET edit" do
    it "assigns the requested production_year as @production_year" do
      production_year = ProductionYear.create! valid_attributes
      get :edit, :id => production_year.id.to_s
      assigns(:production_year).should eq(production_year)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProductionYear" do
        expect {
          post :create, :production_year => valid_attributes
        }.to change(ProductionYear, :count).by(1)
      end

      it "assigns a newly created production_year as @production_year" do
        post :create, :production_year => valid_attributes
        assigns(:production_year).should be_a(ProductionYear)
        assigns(:production_year).should be_persisted
      end

      it "redirects to the created production_year" do
        post :create, :production_year => valid_attributes
        response.should redirect_to(ProductionYear.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved production_year as @production_year" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductionYear.any_instance.stub(:save).and_return(false)
        post :create, :production_year => {}
        assigns(:production_year).should be_a_new(ProductionYear)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductionYear.any_instance.stub(:save).and_return(false)
        post :create, :production_year => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested production_year" do
        production_year = ProductionYear.create! valid_attributes
        # Assuming there are no other production_years in the database, this
        # specifies that the ProductionYear created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProductionYear.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => production_year.id, :production_year => {'these' => 'params'}
      end

      it "assigns the requested production_year as @production_year" do
        production_year = ProductionYear.create! valid_attributes
        put :update, :id => production_year.id, :production_year => valid_attributes
        assigns(:production_year).should eq(production_year)
      end

      it "redirects to the production_year" do
        production_year = ProductionYear.create! valid_attributes
        put :update, :id => production_year.id, :production_year => valid_attributes
        response.should redirect_to(production_year)
      end
    end

    describe "with invalid params" do
      it "assigns the production_year as @production_year" do
        production_year = ProductionYear.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductionYear.any_instance.stub(:save).and_return(false)
        put :update, :id => production_year.id.to_s, :production_year => {}
        assigns(:production_year).should eq(production_year)
      end

      it "re-renders the 'edit' template" do
        production_year = ProductionYear.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductionYear.any_instance.stub(:save).and_return(false)
        put :update, :id => production_year.id.to_s, :production_year => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested production_year" do
      production_year = ProductionYear.create! valid_attributes
      expect {
        delete :destroy, :id => production_year.id.to_s
      }.to change(ProductionYear, :count).by(-1)
    end

    it "redirects to the production_years list" do
      production_year = ProductionYear.create! valid_attributes
      delete :destroy, :id => production_year.id.to_s
      response.should redirect_to(production_years_url)
    end
  end

end