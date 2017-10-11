class CustomersController < ApplicationController
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html
      format.csv { send_data @customers.to_csv, filename: "customers-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /customers/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @customer = Customer.new
  end

  # Control logic when creating a new customer
  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    # write customer to database
    if @customer.save
      redirect_to customers_path, :notice => 'Kunde erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /customers/:id
  def show
    @customer = Customer.find(params[:id])
  end

  # Control logic for edit-view
  # GET /customers/:id/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # Save an updated customer
  # PUT /customers/:id
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path, :notice => 'Kunde erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a customer
  # DELETE /customers/:id
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path, :notice => 'Kunde wurde gelöscht.'
  end


  def import
    status = Customer.import(params[:file])
    if !status.nil?
      redirect_to customers_path, :notice => status
    else
      redirect_to customers_path, :notice => 'Kundenliste erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new customer
  def customer_params
    params.require(:customer).permit!
  end
end
