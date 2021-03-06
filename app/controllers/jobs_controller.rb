class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  layout 'services'
  # GET /jobs
  # GET /jobs.json
  def index
    
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.backups.build
    @t = Time.now - 86400
    p current_user.id
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create

    @job = Job.new(job_params)
    @user = job_params[:user_id]
    p "Usuario = #{@user}"
    respond_to do |format|
      if @job.save

        contact = User.where(:id => @user).first
        email = "#{contact.login}@bacg.intraer"
        puts @job
        job = Job.find(@job.id)
        ContactMailer.contact_message(contact.login, @job, email).deliver

        format.html { redirect_to root_path, notice: 'Serviço cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @job }
      else
        
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:user_id, :day_thread, :alteration, backups_attributes: [:server_id])
    end
end
