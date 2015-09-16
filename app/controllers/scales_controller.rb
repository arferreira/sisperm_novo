class ScalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scale, only: [:show, :edit, :update, :destroy]
  layout 'scales'
  # GET /scales
  # GET /scales.json
  def index
    @scales = Scale.by_month(Time.now.month)   
  end

  def report
   
  end

  # GET /scales/1
  # GET /scales/1.json
  def show
    
  end

  # GET /scales/new
  def new
    @scale = Scale.new
  end

  def scale_save
   save =  get_scale(Time.now.month, Time.now.year)
   if save
         redirect_to scales_path, notice: 'Escala gerada com sucesso!.' 
        
      else
        redirect_to scales_path, notice: 'Ocorreu um erro ao gerar a escala!.'
      end
  end

  # GET /scales/1/edit
  def edit
  end

  # POST /scales
  # POST /scales.json
  def create

     
  end

  # PATCH/PUT /scales/1
  # PATCH/PUT /scales/1.json
  def update
    respond_to do |format|
      if @scale.update(scale_params)
        format.html { redirect_to @scale, notice: 'Escala alterada com sucesso!' }
        format.json { render :show, status: :ok, location: @scale }
      else
        format.html { render :edit }
        format.json { render json: @scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scales/1
  # DELETE /scales/1.json
  def destroy
    @scale.destroy
    respond_to do |format|
      format.html { redirect_to scales_url, notice: 'Scale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Gerando Escala Corrida

  def get_scale(month, year)
    @year = year 
    @month =  month

    @stays = Stay.where(:status => true)

    @scale_day = Hash.new
    

    @stay_status = 'f'
    days_month = Time.days_in_month(@month, @year)

    puts days_month 

    id_soldier = Array.new
     
    i = 1
    

    while i <= days_month.to_i 
        
      @stays.each do |stay|
        id_soldier.push(stay.id)
      end
      str_date = "#{@year}-#{@month}-#{i}"
      str_date = Date.parse str_date
      # Montando o Objeto scale
      @scale_day[:stay_id] = id_soldier[i]      
      @scale_day[:day_scale] = str_date
      @scale_day[:status] = true

       i += 1
      p @scale_day
      ob_scale = Scale.create(@scale_day)
    end

end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scale
      @scale = Scale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scale_params
      params.require(:scale).permit(:stay_id, :day_scale, :month_scale, :year_scale, :status)
    end
end
