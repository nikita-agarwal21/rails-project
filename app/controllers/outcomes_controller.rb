class OutcomesController < ApplicationController
    before_action :set_outcome, only: %i[ show edit update destroy ]
    
       
    def index
      @outcomes = Outcome.all
    end
  
    def show
    end
  

    def new
      @outcome = Outcome.new
    end
  
    def edit
    end
  
    def create
      @outcome = Outcome.new(outcome_params)
  
      respond_to do |format|
        if @outcome.save
          format.html { redirect_to outcome_url(@outcome), notice: "result was successfully created." }
          format.json { render :show, status: :created, location: @outcome }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @outcome.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
    def update
      respond_to do |format|
        if @outcome.update(outcome_params)
          format.html { redirect_to outcome_url(@outcome), notice: "result was successfully updated." }
          format.json { render :show, status: :ok, location: @outcome }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @outcome.errors, status: :unprocessable_entity }
        end
      end
    end
  
   
    def destroy
      @outcome.destroy
  
      respond_to do |format|
        format.html { redirect_to outcomes_url, notice: "result was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      def set_outcome
        @outcome = Outcome.find(params[:id])
      end
  
      def outcome_params
        params.require(:outcome).permit(:usn, :course_code, :cee_obtained, :see_obtained, :student_id, :course_id)
      end



end
