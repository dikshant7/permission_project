class TableController < ApplicationController
  @@my_array=Array.new
  @@form_data=Array.new
  def index
    if params[:search] && params[:search]!=""
      #@tables = Table.where("name LIKE ?", "%#{params[:search]}%")
      @all_tables_array=@@my_array

      #new code started here
      @query = params[:search]
      @list_of_initials = @query.delete(' ').split(',')
      @tables = []
      @nested_listOf_tables = []
      @all_tables = Table.all
      @list_of_tables = @all_tables.pluck(:name)
      @list_of_initials.each do |initial|
        @nested_listOf_tables << @list_of_tables.grep(/^#{initial}/)
      end
      @nested_listOf_tables.each do |result|
        result.each do |new_result|
          @tables << new_result
        end
      end

    end
  end
  def submit_form
    @sql = []
    @user_name = 'harshitm'
    @data = params[:data]


    @data.each do |key,value|
      table_name = key
      crud_hash = value



      permission = []

      if crud_hash['1']=='1'
        permission << "INSERT"
      end
      if crud_hash['2']=='1'

        permission << "SELECT"

      end
      if crud_hash['3']=='1'
        permission << "UPDATE"

      end
      if crud_hash['4']=='1'
        permission << "DELETE"

      end

      if permission.length!=0
        @sql << "GRANT #{permission.join(", ")} ON `ebdb`.`#{table_name}` TO `#{@user_name}`@`%`;"
      else
        @sql << "NO CRUD OPERATIONS SELECTED"
      end

    end


    # render 'submit_form'



  end
end
