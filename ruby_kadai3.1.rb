puts "ruby_kadai3"
coin = 1
#最初の手持ちコイン枚数

class Roulette ()

  def slot(coin)
    @coin = coin
    #デバッグ用------------
    #puts "slotメソッド開始"
    #デバッグ用------------
    puts "現在のコイン枚数#{@coin}枚"
    puts "コインを何枚賭けますか？"
    puts "[1]1枚(真ん中1列のみ) [2]2枚(横3列) [3]3枚(横3列に斜めも含む)"
    @hantei = gets.to_i
    case @hantei
      when 1,2,3
        if @coin < @hantei
          puts "コインが足りません"
          exit
        else
          puts "#{@hantei}枚賭けます"
          @coin = @coin - @hantei
          puts "現在のコイン枚数:#{@coin}枚"
        end
      when 999
        puts "デバッグのため抜けます"
        exit
      else 
        puts "そんなに賭けられません"
        slot(@coin)
    end
    @left = [rand(1..9),rand(1..9),rand(1..9),]
    @center = [" "," "," "]
    @right = [" "," "," "]
    
    puts "|#{@left[0]}|#{@center[0]}|#{@right[0]}|"
    puts "|#{@left[1]}|#{@center[1]}|#{@right[1]}|"
    puts "|#{@left[2]}|#{@center[2]}|#{@right[2]}|"
    
    puts "----------"
    
    @center = [rand(1..9),rand(1..9),rand(1..9),]
    puts "|#{@left[0]}|#{@center[0]}|#{@right[0]}|"
    puts "|#{@left[1]}|#{@center[1]}|#{@right[1]}|"
    puts "|#{@left[2]}|#{@center[2]}|#{@right[2]}|"
    
    puts "----------"
    
    @right = [rand(1..9),rand(1..9),rand(1..9),]
    puts "|#{@left[0]}|#{@center[0]}|#{@right[0]}|"
    puts "|#{@left[1]}|#{@center[1]}|#{@right[1]}|"
    puts "|#{@left[2]}|#{@center[2]}|#{@right[2]}|"
    
    puts "----------"
    
    atari_hantei()
  
  end
  
  def atari_hantei()
    #デバッグ用-----------
    puts "atari_hanteiメソッドの開始"
    #puts @left
    #puts @center
    #puts @right
    #puts @coin
    #@left[1] = 1
    #@center[1] = 1
    #@right[1] = 1
    #デバッグ用-----------

    
    case @hantei
      when 3
        atari_hantei_hidariue()
        atari_hantei_ue()
        atari_hantei_center()
        atari_hantei_shita()
        atari_hantei_shita()
      when 2
        atari_hantei_ue()
        atari_hantei_center()
        atari_hantei_shita()
      when 1
        atari_hantei_center()

    end
    puts "----------"
    puts "slotを再開します"
    slot(@coin)
    
  end
  
  def atari_hantei_center ()
    #真ん中横一列の判定
    if @left[1] == @center[1] and @center[1] == @right[1]
      puts "真ん中列当たりです　コインが10枚増えます"
      @coin = @coin + 10
    else
      puts "真ん中列ハズレです"
    end
  end

  def atari_hantei_ue()
    #真ん中横一列の判定
    if @left[0] == @center[0] and @center[0] == @right[0]
      puts "上列当たりです　コインが10枚増えます"
      @coin = @coin + 10
    else
      puts "上列ハズレです"
    end
  end
  
  def atari_hantei_shita ()
    #真ん中横一列の判定
    if @left[2] == @center[2] and @center[2] == @right[2]
      puts "下列当たりです　コインが10枚増えます"
      @coin = @coin + 10
    else
      puts "下列ハズレです"
    end
  end  

  def atari_hantei_hidariue ()
    #真ん中横一列の判定
    if @left[0] == @center[1] and @center[1] == @right[2]
      puts "左上からの斜め当たりです　コインが10枚増えます"
      @coin = @coin + 10
    else
      puts "左上からの斜めハズレです"
    end
  end  

  def atari_hantei_hidarishita ()
    #真ん中横一列の判定
    if @left[2] == @center[1] and @center[1] == @right[0]
      puts "左下からの斜め当たりです　コインが10枚増えます"
      @coin = @coin + 10
    else
      puts "左下からの斜めハズレです"
    end
  end  

end

roulette = Roulette.new()
roulette.slot(coin)