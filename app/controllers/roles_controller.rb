class RolesController < ApplicationController
  
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end
def show
  @user = User.includes(user_detail: :role).find(params[:id]) 
end


  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:notice] = "Role created successfully"
      redirect_to roles_path
    else
      render :new
    end
  end

  def edit
    # @role is set via the before_action
  end

  def update
    if @role.update(role_params)
      flash[:notice] = "Role updated successfully"
      redirect_to roles_path
    else
      render :edit
    end
  end

 def destroy
    role = Role.find_by(name: params[:name])

    if role
      if role.destroy
        flash[:notice] = "Role '#{role.name}' successfully deleted."
      else
        flash[:alert] = "Failed to delete the role. Please try again."
      end
    else
      flash[:alert] = "Role not found with the specified name and code."
    end

    redirect_to roles_path 
  end

private
def role_params
    params.require(:role).permit(:name)
  end
end
