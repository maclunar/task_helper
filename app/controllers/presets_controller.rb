class PresetsController < ApplicationController
  def show
    @preset = Preset.find(params[:id])
  end

  def index
    @presets = Preset.all.order(:title)
  end

  def new
    @preset = Preset.new
  end

  def edit
    @preset = Preset.find(params[:id])
  end

  def create
    @preset = Preset.new(preset_params)

    if @preset.save
      redirect_to @preset
    else
      render 'new'
    end
  end

  def update
    @preset = Preset.find(params[:id])

    if @preset.update(preset_params)
      redirect_to @preset
    else
      render 'edit'
    end
  end

  def destroy
    @preset = Preset.find(params[:id])
    @preset.destroy

    redirect_to presets_path
  end

  private
    def preset_params
      params.require(:preset).permit(:title, :description)
    end
end
