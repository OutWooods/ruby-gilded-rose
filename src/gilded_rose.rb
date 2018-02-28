class GildedRose
  DEFAULT_DEPRECIATION = -1
  SELL_IN_CHANGE = -1
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  DEFAULT_IMPROVEMENT = 1
  BACKSTAGE_PASS_SLIGHT_SELL = 11
  BACKSTAGE_PASS_PREMIUM_SELL = 6
  BACKSTAGE_PASS_SLIGHT_CHANGE = 1
  BACKSTAGE_PREMIUM_CHANGE = 1

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
    name = item.name
    unless dont_change(name)
      unless item.name == "Aged Brie" or item.name == "Backstage passes to a TAFKAL80ETC concert" #rule 2 and rule 6
        if item.quality > MIN_QUALITY   #rule 2
            item.quality += DEFAULT_DEPRECIATION
        end
     # things that increase in quality (or back stage passes) rule 3 and 6
      else
        if item.quality < MAX_QUALITY
          item.quality += DEFAULT_IMPROVEMENT
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < BACKSTAGE_PASS_SLIGHT_SELL
              if item.quality < MAX_QUALITY # not sure why there is repetition here?
                item.quality += BACKSTAGE_PASS_SLIGHT_CHANGE
              end
            end
            if item.sell_in < BACKSTAGE_PASS_PREMIUM_SELL
              if item.quality < MAX_QUALITY
                item.quality += BACKSTAGE_PREMIUM_CHANGE
              end
            end
          end
        end
      end

        item.sell_in += SELL_IN_CHANGE


      # rule 1 double speed
      if item.sell_in < MIN_QUALITY
        if item.name != "Aged Brie" # rule 3
          if item.name != "Backstage passes to a TAFKAL80ETC concert" # rule 6
            if item.quality > MIN_QUALITY # rule 2
                item.quality += DEFAULT_DEPRECIATION
            end
          else
            item.quality = MIN_QUALITY
          end
       # default increase for backstage pass
        elsif item.quality < MAX_QUALITY
          item.quality += DEFAULT_IMPROVEMENT
        end
      end
    end
  end
  end

  private

  def dont_change(name)
    name == "Sulfuras, Hand of Ragnaros"
  end

end
