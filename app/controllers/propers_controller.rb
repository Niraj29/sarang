class PropersController < ApplicationController
	
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :find_user, :except => [:index, :show]
  # GET /propers
  # GET /propers.json
  def index
  	@search = Proper.search(params[:search])
    @propers = @search.all # or @search.relation to lazy load in view

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @propers }
      format.xml { render :xml => @propers }
    end
  end
  
  # GET /propers/1
  # GET /propers/1.json
  def show
    @proper = Proper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proper }
#      format.xml  { render :action => "population.xml.builder", :layout => false }
    
      format.xml { render :action => "hcubestrip.xml.builder" }
    end
  end
  
  # GET /propers/new
  # GET /propers/new.json
  def new
    @proper = Proper.new(:user => @user)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proper }
    end
  end

  # GET /propers/1/edit
  def edit
  	@check = Proper.find(params[:id])
  	if @check.email == current_user.email
       @proper = Proper.find(params[:id])
    else
    	flash[:notice] = "not allowed"
    	redirect_to propers_url
    end
  end

  # POST /propers
  # POST /propers.json
  def create
    @proper = Proper.new(params[:proper])

    respond_to do |format|
      if @proper.save
        format.html { redirect_to @proper, notice: 'Proper was successfully created.' }
        format.json { render json: @proper, status: :created, location: @proper }
      else
        format.html { render action: "new" }
        format.json { render json: @proper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /propers/1
  # PUT /propers/1.json
  def update
    @proper = Proper.find(params[:id])

    respond_to do |format|
      if @proper.update_attributes(params[:proper])
        format.html { redirect_to @proper, notice: 'Property was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @proper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /propers/1
  # DELETE /propers/1.json
  def destroy
  	@check = Proper.find(params[:id])
  	if @check.email == current_user.email
    	@proper = Proper.find(params[:id])
    	@proper.destroy
    	
    	respond_to do |format|
      		format.html { redirect_to @user }
      		format.json { head :ok }
    	end
    else
    	flash[:alert] = "not allowed"
    	redirect_to propers_url
    end
  end
  
  protected

    def find_user
      if params[:user_id]
       @user = User.find(params[:user_id])
      else
        @proper = Proper.find(params[:id])
        @user = @proper.user
        
      end
      unless current_user == @user
        redirect_to @user, :alert => "Are you logged in properly? You are not allowed to create or change someone else's subdomain."
      end
    end

end
