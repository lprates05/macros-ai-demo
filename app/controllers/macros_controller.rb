class MacrosController < ApplicationController

  def display_form
    @image_upload = <img src = "">


    render({:template => "forms_template/blank_form"})
  end

end
