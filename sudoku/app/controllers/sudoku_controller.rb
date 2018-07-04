class SudokuController < ApplicationController
    def home
        @mytime = Time.now.asctime
    end

    def init
        Number.destroy_all
        Number.create(:index => "1", :value => "2")
        Number.create(:index => "2", :value => "1")
        Number.create(:index => "3", :value => "0")
        Number.create(:index => "4", :value => "0")
        Number.create(:index => "5", :value => "3")
        Number.create(:index => "6", :value => "1")
        Number.create(:index => "7", :value => "0")
        Number.create(:index => "8", :value => "1")
        Number.create(:index => "9", :value => "0")
    end
end