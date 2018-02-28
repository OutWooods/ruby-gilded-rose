class GildedRose
  DEFAULT_DEPRECIATION = 1
  SELL_IN_CHANGE = -1
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  DEFAULT_IMPROVEMENT = 1

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # quality goes down by 1 for anything other than the rules 3, 5, 6  below
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" #rule 2 and rule 6
        if item.quality > MIN_QUALITY   #rule 2
          if item.name != "Sulfuras, Hand of Ragnaros" # rule 5
            item.quality -= DEFAULT_DEPRECIATION
          end
        end
     # things that increase in quality (or back stage passes) rule 3 and 6
      else
        if item.quality < MAX_QUALITY
          item.quality += DEFAULT_IMPROVEMENT
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < MAX_QUALITY # not sure why there is repetition here?
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < MAX_QUALITY
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in += SELL_IN_CHANGE
      end

      # rule 1 double speed
      if item.sell_in < MIN_QUALITY
        if item.name != "Aged Brie" # rule 3
          if item.name != "Backstage passes to a TAFKAL80ETC concert" # rule 6
            if item.quality > MIN_QUALITY # rule 2
              if item.name != "Sulfuras, Hand of Ragnaros" # rule 5
                item.quality -= DEFAULT_DEPRECIATION
              end
            end
          else
            item.quality = item.quality - item.quality # rule 6
          end
       # default increase for backstage pass
        elsif item.quality < MAX_QUALITY
          item.quality = item.quality + 1
        end
      end
    end
  end
end
