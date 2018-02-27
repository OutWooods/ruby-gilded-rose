class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      # quality goes down by 1 for anything other than the rules 3, 5, 6  below
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" #rule 2 and rule 6
        if item.quality > 0   #rule 2
          if item.name != "Sulfuras, Hand of Ragnaros" # rule 5
            item.quality -= 1 # rule 1 ()
          end
        end

     # things that increase in quality (or back stage passes) rule 3 and 6
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50 # not sure why there is repetition here?
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end

      # rule 1 double speed
      if item.sell_in < 0
        if item.name != "Aged Brie" # rule 3
          if item.name != "Backstage passes to a TAFKAL80ETC concert" # rule 6
            if item.quality > 0 # rule 2
              if item.name != "Sulfuras, Hand of Ragnaros" # rule 5
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality # rule 6
          end

        else # rule 3
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
