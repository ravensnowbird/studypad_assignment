class EditorsController < ApplicationController
  # GET /editors
  # GET /editors.json
  def index
    @editors = User.where("users.id != ?", current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @editors }
    end
  end

  # GET /editors/1
  # GET /editors/1.json
  def show
    @editor = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @editor }
    end
  end

  # GET /editors/new
  # GET /editors/new.json
  def new
    @editor = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @editor }
    end
  end

  # GET /editors/1/edit
  def edit
    @editor = User.find(params[:id])
  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = User.new(params[:user])

    respond_to do |format|
      if @editor.save
        format.html { redirect_to editors_path, notice: 'User was successfully created.' }
        format.json { render json: @editor, status: :created, location: @editor }
      else
        puts @editor.errors.inspect
        format.html { render action: "new" }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /editors/1
  # PUT /editors/1.json
  def update
    @editor = User.find(params[:id])

    respond_to do |format|
      if @editor.update_attributes(params[:user])
        format.html { redirect_to editors_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    @editor = User.find(params[:id])
    @editor.destroy

    respond_to do |format|
      format.html { redirect_to editors_url }
      format.json { head :no_content }
    end
  end
end
