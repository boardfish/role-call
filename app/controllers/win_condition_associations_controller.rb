class WinConditionAssociationsController < ApplicationController
  before_action :set_win_condition_association, only: [:show, :edit, :update, :destroy]

  # GET /win_condition_associations
  # GET /win_condition_associations.json
  def index
    @win_condition_associations = WinConditionAssociation.all
  end

  # GET /win_condition_associations/1
  # GET /win_condition_associations/1.json
  def show
  end

  # GET /win_condition_associations/new
  def new
    @win_condition_association = WinConditionAssociation.new
  end

  # GET /win_condition_associations/1/edit
  def edit
  end

  # POST /win_condition_associations
  # POST /win_condition_associations.json
  def create
    @win_condition_association = WinConditionAssociation.new(win_condition_association_params)

    respond_to do |format|
      if @win_condition_association.save
        format.html { redirect_to @win_condition_association, notice: 'Win condition association was successfully created.' }
        format.json { render :show, status: :created, location: @win_condition_association }
      else
        format.html { render :new }
        format.json { render json: @win_condition_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /win_condition_associations/1
  # PATCH/PUT /win_condition_associations/1.json
  def update
    respond_to do |format|
      if @win_condition_association.update(win_condition_association_params)
        format.html { redirect_to @win_condition_association, notice: 'Win condition association was successfully updated.' }
        format.json { render :show, status: :ok, location: @win_condition_association }
      else
        format.html { render :edit }
        format.json { render json: @win_condition_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /win_condition_associations/1
  # DELETE /win_condition_associations/1.json
  def destroy
    @win_condition_association.destroy
    respond_to do |format|
      format.html { redirect_to win_condition_associations_url, notice: 'Win condition association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_win_condition_association
      @win_condition_association = WinConditionAssociation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def win_condition_association_params
      params.require(:win_condition_association).permit(:win_condition_id, :role_id)
    end
end
