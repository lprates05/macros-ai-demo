class MacrosController < ApplicationController

  def display_form
  
    render({:template => "forms_template/blank_form"})
  end


  def process_inputs

    @the_image = params.fetch("image_param")
    @the_description = params.fetch("description_param")

    render({:template => "forms_template/results"})
    
  end

end
