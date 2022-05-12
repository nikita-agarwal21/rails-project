class RewardsController < ApplicationController
    
        before_action :set_result, only: %i[ show edit update destroy ]
    
       
        def index
          @rewards = Reward.all
        end
      
        def show
        end
      
    
        def new
          @reward = Reward.new
        end
      
        def edit
        end
      
        def create
          @reward = Reward.new(reward_params)
      
          respond_to do |format|
            if @reward.save
              format.html { redirect_to reward_url(@reward), notice: "result was successfully created." }
              format.json { render :show, status: :created, location: @reward }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @reward.errors, status: :unprocessable_entity }
            end
          end
        end
      
      
        def update
          respond_to do |format|
            if @reward.update(reward_params)
              format.html { redirect_to reward_url(@reward), notice: "result was successfully updated." }
              format.json { render :show, status: :ok, location: @reward }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @reward.errors, status: :unprocessable_entity }
            end
          end
        end
      
       
        def destroy
          @reward.destroy
      
          respond_to do |format|
            format.html { redirect_to rewards_url, notice: "result was successfully destroyed." }
            format.json { head :no_content }
          end
        end
      
        private
          def set_reward
            @reward = Reward.find(params[:id])
          end
      
          def reward_params
            params.require(:reward).permit(:usn, :course_code, :cee_obtained, :see_obatined, :student_id, :course_id)
          end
    
    


end
