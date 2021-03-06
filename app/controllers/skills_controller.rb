class SkillsController < ApplicationController

  def show
      @subject = Subject.find(params[:subject_id])
      @skill = Skill.find(params[:id])
  end

  def index

  end

  def new
    @skill = Skill.new
    @subject = Subject.find(params[:subject_id])
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @skill = Skill.new(skills_params)
    if @skill.save
      redirect_to subject_skill_path(@skill.subject, @skill)
    else
      render 'index'
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to subjects_path, notice: 'The Skill was was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def skills_params
    params.require(:skill).permit(:name, :subject_id, :id)
  end
end
