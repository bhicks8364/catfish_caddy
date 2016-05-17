module FishHelper
    def status(fish)
        if fish.returned == true
            "RETURNED"
        else
            "ON STRINGER"
        end
    end
    def fish_color(fish)
        fish.color.name.present? ? fish.color.name.downcase : ""
    end
    def icon(fish)
        image_tag("fish_1.png", class: "icon #{ fish_color(fish) }") 
    end
end
