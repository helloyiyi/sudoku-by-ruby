class SudokuController < ApplicationController
    def home
        @mytime = Time.now.asctime
    end
end