class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :toggle_completed, :assigned]
  before_action :signed_in_user
  before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = current_user.todos.order(created_at: :desc)
    @coords_array = (Assignee.get_assignee_coords).concat(Todo.get_todo_coords)
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    assignee_id_to_send_sms = Assignee.find(params[:todo][:assignee_id])
    @todo.user = current_user
    @todo.send_sms(assignee_id_to_send_sms)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_path, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_path, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_completed
    @todo.completed = !@todo.completed
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path }
        format.json { render :show, status: :ok, location: @todo }
      else
        # show some error message
      end
    end
  end

  def assigned
    @todo.assigned = !@todo.assigned
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path }
        format.json { render :show, status: :ok, location: @todo }
      else
        # show some error message
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :completed, :due_date, :assignee_id, :user_id, :business_name, :street, :city, :state, :zip, :what, :icon)
    end

    def verify_correct_user
      @todo = current_user.todos.find_by(id: params[:id])
      redirect_to root_url, notice: 'Access Denied!' if @todo.nil?
    end
end
