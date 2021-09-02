class MissionsController < ApplicationController
    before_action :find_mission, only: [:edit, :update, :destroy]

    def index
        @missions = Mission.all        
    end

    def new
        @mission = Mission.new
    end

    def create
        @mission = Mission.new(mission_params)
        if @mission.save
          flash[:success] = "任務新增成功"
          redirect_to missions_path
        else
          flash[:error] = "任務新增失敗"
          render 'new'
        end
    end

    def edit
    end
    
    def update
        if @mission.update(mission_params)
          flash[:success] = "任務更新成功"
          redirect_to missions_path
        else
          flash[:error] = "任務更新失敗"
          render 'edit'
        end
    end
    
    def destroy
        if @mission.destroy
            flash[:success] = '任務刪除成功'
            redirect_to missions_path
        else
            flash[:error] = '任務刪除失敗'
            redirect_to missions_path
        end
    end
    

    private
    def mission_params
        params.require(:mission).permit(:title, :content, :start_at, :end_at, :status, :piority)
    end

    def find_mission
        @mission = Mission.find_by(id: params[:id])
    end
    
end
