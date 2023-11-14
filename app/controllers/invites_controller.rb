class InvitesController < ApplicationController
  before_action :logged_in_user
  before_action :set_invite, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[ show edit update destroy create]

  # GET /invites or /invites.json
  def index
    @invites = Invite.all
  end

  # GET /invites/1 or /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites or /invites.json
  def create
    @invite = Invite.new
    @invite.invite_user = User.find_by(id: params[:invite][:invite_user_id])
    @invite.invite_group_id = @group.id
    @invite.create_user_id = current_user.id
    respond_to do |format|
      if @invite.save
        format.html { redirect_to invite_url(@invite), notice: "Invite was successfully created." }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { redirect_to invite_url(group_id: @group.id), status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1 or /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @group, notice: "Invite was successfully updated." }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { redirect_to @group, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1 or /invites/1.json
  def destroy
    if params[:user_id] != -1
      current_user.groups << @invite.invite_group
    end
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to home_url(id: @group.id), notice: "Invite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_groups
    @groups = current_user.groups
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invite_params
      params.require(:invite).permit(:invite_user_id, :inveite_group_id)
    end

    def set_group
      @group = Group.find_by(id: params[:group_id])
      if @group.nil?
        redirect_to groups_path
      end
    end
end
