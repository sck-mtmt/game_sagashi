module Public::ReviewsHelper
 def getPercent(number)
   if number.present?
     calPercent = (number.to_f/5)* 100
     percent = calPercent.round
     return percent.to_s
   else
     return 0
   end
 end
end
