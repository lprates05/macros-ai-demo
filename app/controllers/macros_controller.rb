class MacrosController < ApplicationController

  def display_form
  
    render({:template => "forms_template/blank_form"})
  end


  def process_inputs

    @the_image = params.fetch("image_param", false)
    # @the_image = params["image_param"]
    @the_description = params.fetch("description_param")


     c = OpenAI::Chat.new 
     c.system("You are a nutritionist. The user will give you an image and or description of a meal. Your job is to estimate the macornutrients for them") 
     c.user(@the_description) 
     c.schema = '{
    "name": "nutritional_information",
    "schema": {
      "type": "object",
      "properties": {
        "carbohydrates": {
          "type": "number",
          "description": "The amount of carbohydrates in grams."
        },
        "protein": {
          "type": "number",
          "description": "The amount of protein in grams."
        },
        "fat": {
          "type": "number",
          "description": "The amount of fat in grams."
        },
        "total_calories": {
          "type": "number",
          "description": "The total caloric value in grams."
        }
      },
      "required": [
        "carbohydrates",
        "protein",
        "fat",
        "total_calories"
      ],
      "additionalProperties": false
    },
    "strict": true
  }' 

    @structured_output = c.assistant!
     c.assistant! 

    render({:template => "forms_template/results"})

  end

end
