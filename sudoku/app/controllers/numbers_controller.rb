class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :edit, :update, :destroy, :validate_sudoku]

  # GET /numbers
  # GET /numbers.json
  def index
    @numbers = Number.all
  end

  # GET /numbers/1
  # GET /numbers/1.json
  def show
  end

  # GET /numbers/new
  def new
    @number = Number.new
  end

  # GET /numbers/1/edit
  def edit
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(number_params)

    respond_to do |format|
      if @number.save
        format.html { redirect_to @number, notice: 'Number was successfully created.' }
        format.json { render :show, status: :created, location: @number }
      else
        format.html { render :new }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numbers/1
  # PATCH/PUT /numbers/1.json
  def update
    respond_to do |format|
      if @number.update(number_params)
        format.html { redirect_to @number, notice: 'Number was successfully updated.' }
        format.json { render :show, status: :ok, location: @number }
      else
        format.html { render :edit }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbers/1
  # DELETE /numbers/1.json
  def destroy
    @number.destroy
    respond_to do |format|
      format.html { redirect_to numbers_url, notice: 'Number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def validate
    @current_number_count = Number.count
    if @current_number_count <9 
        respond_to do |format|
        format.html { redirect_to numbers_url, notice: "Numbers are not enough, you are missing #{9- @current_number_count} numbers"}
        end
      else
        @hashmap = Number.pluck(:index, :value)
        i = 0
        while i <= 8 do
          index = @hashmap[i][0]
          if index == 1
            @valueof1 = @hashmap[i][1]
          elsif index == 2
            @valueof2 = @hashmap[i][1]
          elsif index == 3
            @valueof3 = @hashmap[i][1]
          elsif index == 4
            @valueof4 = @hashmap[i][1]
          elsif index == 5
            @valueof5 = @hashmap[i][1]
          elsif index == 6
            @valueof6 = @hashmap[i][1]
          elsif index == 7
            @valueof7 = @hashmap[i][1]
          elsif index == 8
            @valueof8 = @hashmap[i][1]
          elsif index == 9
            @valueof9 = @hashmap[i][1]
          end
          i += 1
        end
        @valueof123 = @valueof1 + @valueof2 + @valueof3
        @valueof456 = @valueof4 + @valueof5 + @valueof6
        @valueof789 = @valueof7 + @valueof8 + @valueof9
        if @valueof123 != 6 || @valueof456 != 6 || @valueof789 != 6
          respond_to do |format|
            format.html { redirect_to numbers_url, notice: "The sum of 1, 2, 3 is #{@valueof123}, the sum of 4, 5, 6 is #{@valueof456}, the sum of 7, 8, 9 is #{@valueof789}"}
          end
        else
          respond_to do |format|
            format.html { redirect_to numbers_url, notice: "Congratulations! You solved the puzzle!!!"}
          end
        end
      end
    end

    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:index, :value)
    end
end


