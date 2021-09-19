class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[show edit destroy]

  # GET /friendships or /friendships.json
  def index
    @friendships = Friendship.all
    a = current_user.friends.pluck(:friend_id)
    a << current_user.id
    @users = User.where.not('id IN (?)', a)
    @pending = current_user.pending_friendships.pluck(:friend_id)
    @inverted = current_user.inverted_friendships.pluck(:user_id)
  end

  # GET /friendships/1 or /friendships/1.json
  def show
    # show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
    # show
  end

  # POST /friendships or /friendships.json
  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to friendships_url, notice: 'Friendship was successfully created.' }
        format.json { render :index, status: :created, location: @friendship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1 or /friendships/1.json
  def update
    @friendship = Friendship.find(params[:id])
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_friendship
    @friendship = Friendship.find(params[:id])
    @friendship.confirm_friend
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to friendships_url, notice: 'Friendship was successfully updated.' }
        format.json { render :index, status: :ok, location: @friendship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_friendship
    friendship = params[:friendships]
    @friendships = Friendship.where('friend_id =? or user_id =? AND user_id =? or friend_id =?', current_user.id, friendship, current_user.id, friendship)
    @friendships.delete_all
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friendship_params
    params.require(:friendship).permit(:user_id, :confirmed, :friend_id)
  end
end
