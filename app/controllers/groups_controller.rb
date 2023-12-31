class GroupsController < ApplicationController
  before_action :logged_in_user
  before_action :set_groups
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index

  end

  # GET /groups/1 or /groups/1.json
  def show
    @members = @group.users.all;
    @invite = Invite.new
  end

  # GET /groups/new
  def new
    @group = Group.new
    @group.name = "新しいグループ"
  end

  # GET /groups/1/edit
  def edit
    
    @users = User.all;
  end

  # POST /groups or /groups.json
  def create
    #@group = Group.new(group_params)
    @group = current_user.groups.build(group_params)
    respond_to do |format|
      if @group.save
        current_user.groups << @group
        admin_method = current_user.admins.build(admin_group_id: @group.id)
        admin_method.save
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    admin_method = current_user.admins.build(admin_group_id: @group.id)
    admin_method.destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_groups
      @groups = current_user.groups
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find_by(id: params[:id])
      @books = @group.books
      if @group.nil?
        redirect_to groups_path
      end
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name)
    end

    
end
