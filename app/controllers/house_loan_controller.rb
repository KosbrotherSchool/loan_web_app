class HouseLoanController < ApplicationController

	def index
		@lenders = Lender.where("is_show = true")
	end

	def new
	end

	def join_us
		if params[:msg] == 'success'
			
		else
			@lender = Lender.new
		end
	end

	def pricing
	end

	def about_us	
	end

	def faq	
	end

	def term	
	end

	def privacy	
	end

	def lender_response
	end

	def apply_case	
		if params[:msg] == 'success'
			
		else
			@case = SimpleCase.new
		end
	end

	def case_create
		@case = SimpleCase.new(case_params)

    if @case.save
      redirect_to :controller => 'house_loan', :action => 'apply_case', :msg => 'success'
    else
      render :apply_case
    end
	end


	private 

	def to_boolean(str)
      str == 'true'
  end

	def case_params
		params.require(:simple_case).permit(:name, :line_id, :age, :loan_money, :usage, :is_in_debt, :is_using_card, :other_info)
	end

end
