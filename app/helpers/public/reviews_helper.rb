module Public::ReviewsHelper
 def getPercent(number)
   if number.present?
     calPercent = (number.to_f/5)* 100
     percent = calPercent.round
     #↑CSSは小数が含まれると、widthの幅を指定できないので四捨五入して整数化します！
     return percent.to_s
   else
     return 0
   end
 end
end
